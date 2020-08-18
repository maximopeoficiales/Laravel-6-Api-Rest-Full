<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use App\Cliente;

class ClienteController extends Controller
{
    public function index()
    {
        $json = array('message' => "Falta autenticacion");
        return response()->json($json, 404);
    }
    public function store(Request $request)
    {
        $data = array(
            'nombre' => $request->nombre,
            'apellido' => $request->apellido,
            'email' => $request->email,
        );
        //Validacion
        $validator = Validator::make($data, [
            "nombre" => "required|string|max:255",
            "apellido" => "required|string|max:255",
            "email" => "required|string|email|max:255|unique:clientes",
        ]);
        if ($validator->fails()) {
            $errors = $validator->errors();
            $json = array(
                'status' => 404,
                "details" => $errors
            );
            return response()->json($json, 404);
        }
        //hash encripta un valor, implode combina los valores de un array
        $id_cliente = Hash::make(implode("", $data));
        $llave_secreta = Hash::make(implode(",", $data));
        $data["id_cliente"] = str_replace("$", "a", $id_cliente);
        $data["llave_secreta"] = str_replace("$", "o", $llave_secreta);

        //Guardar en la bd
        $newcliente = Cliente::create($data);
        $newcliente->save();
        $json = array(
            'status' => 200,
            "details" => "Usuario Creado Satisfactoriamente",
            "data" => $newcliente
        );
        return response()->json($json, 200);
    }
}
