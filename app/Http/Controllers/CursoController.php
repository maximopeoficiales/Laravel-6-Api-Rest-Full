<?php

namespace App\Http\Controllers;

use App\Curso;
use App\Cliente;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class CursoController extends Controller
{
    public function isAuthorized($token)
    {
        $token = explode(":", base64_decode(str_replace("Basic ", "", $token)));
        $id_cliente = $token[0];
        $llave_secreta = $token[1];

        $cliente = Cliente::where([["id_cliente", $id_cliente], ["llave_secreta", $llave_secreta]])->get();
        if (count($cliente) != 0) {
            return true;
        }
        return false;
    }
    public function notAuthorized()
    {
        $json = array(
            'status' => 404,
            "details" => "Fallo en autenticacion"
        );
        return response()->json($json);
    }
    public function getUserJson($token)
    {
        $token = explode(":", base64_decode(str_replace("Basic ", "", $token)));
        $id_cliente = $token[0];
        $llave_secreta = $token[1];

        $cliente = Cliente::where([["id_cliente", $id_cliente], ["llave_secreta", $llave_secreta]])->get();
        return $cliente[0];
    }
    public function index(Request $request)
    {
        if ($request->header("Authorization")) {
            if ($this->isAuthorized($request->header("Authorization"))) {
                if (isset($_GET["page"])) {
                    $cursos = DB::table('cursos as c')
                        ->join('clientes as cli', 'cli.id', '=', 'c.id_cliente')
                        ->select('c.id', "c.titulo", "c.descripcion", "c.instructor", "c.imagen", "c.precio", 'cli.nombre', 'cli.apellido')
                        ->paginate(10);
                } else {
                    $cursos = DB::table('cursos as c')
                        ->join('clientes as cli', 'cli.id', '=', 'c.id_cliente')
                        ->select('c.id', "c.titulo", "c.descripcion", "c.instructor", "c.imagen", "c.precio", 'cli.nombre', 'cli.apellido')
                        ->get();
                }

                if (empty($cursos)) {
                    $json = array(
                        'status' => 200,
                        "data" => "Sin registros"
                    );
                    return response()->json($json);
                } else {
                    $json = array(
                        'status' => 200,
                        'total_registros' => count($cursos),
                        "data" => $cursos
                    );
                    return response()->json($json);
                }
            }
            return $this->notAuthorized();
        }
        return $this->notAuthorized();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $token = $request->header("Authorization");
        if ($this->isAuthorized($token)) {
            //$request->all() return json inputs
            if (empty($request->all())) {
                $json = array(
                    'status' => 404,
                    "details" => "Complete almenos un campo"
                );
                return response()->json($json);
            }
            /* si almenos hay un dato lleno */
            $validator = Validator::make($request->all(), [
                "titulo" => "required|string|max:255:unique:cursos",
                "descripcion" => "required|string|max:255:unique:cursos",
                "instructor" => "required|string|max:255",
                "imagen" => "required|string|max:255",
                "precio" => "required|numeric",
            ]);
            //si tiene errores
            if ($validator->fails()) {
                $errors = $validator->errors();
                $json = array(
                    'status' => 404,
                    "details" => $errors
                );
                return response()->json($json, 404);
            } else {
                //obtengo el id cliente
                $id_cliente = $this->getUserJson($token)["id"];
                $curso = Curso::create($request->all());
                $curso->id_cliente = $id_cliente;
                $curso->save();

                $json = array(
                    'status' => 200,
                    'details' => "Registro creado satifactoriamente",
                    'data' => $curso,
                );
                return response()->json($json, 201);
            }
        }
        return $this->notAuthorized();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id, Request $request)
    {
        $token = $request->header("Authorization");
        if ($this->isAuthorized($token)) {
            try {
                $id_cliente = $this->getUserJson($token)["id"];
                $curso = Curso::findOrFail($id); //obtengo el curso con el id
                if (!empty($curso)) {
                    if ($curso["id_cliente"] !== $id_cliente) {
                        $json = array(
                            'status' => 404,
                            'details' => "No tiene permiso de ver este curso",
                        );
                        return response()->json($json, 201);
                    }
                    /* si coinciden el id_cliente */
                    $json = array(
                        'status' => 200,
                        'data' => $curso,
                    );
                    return response()->json($json, 200);
                }
            } catch (\Throwable $th) {
                $json = array(
                    'status' => 404,
                    'details' => "No existe este curso",
                );
                return response()->json($json, 404);
            }
        }
        return $this->notAuthorized();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update($id, Request $request)
    {
        $token = $request->header("Authorization");
        if ($this->isAuthorized($token)) {
            //$request->all() return json inputs
            if (empty($request->all())) {
                $json = array(
                    'status' => 404,
                    "details" => "Complete almenos un campo"
                );
                return response()->json($json);
            }
            /* si almenos hay un dato lleno */
            $validator = Validator::make($request->all(), [
                "titulo" => "required|string|max:255",
                "descripcion" => "required|string|max:255",
                "instructor" => "required|string|max:255",
                "imagen" => "required|string|max:255",
                "precio" => "required|numeric",
            ]);
            //si tiene errores
            if ($validator->fails()) {
                $errors = $validator->errors();
                $json = array(
                    'status' => 404,
                    "details" => $errors
                );
                return response()->json($json, 404);
            } else {
                try {
                    $id_cliente = $this->getUserJson($token)["id"];
                    $curso = Curso::findorFail($id); //obtengo el curso con el id
                    if ($curso["id_cliente"] !== $id_cliente) {
                        $json = array(
                            'status' => 404,
                            'details' => "No tiene permiso actualizar este curso",
                        );
                        return response()->json($json, 201);
                    }
                    //al usar este metodo me devuelve un objeto
                    $curso = Curso::where("id", $id)->update($request->all());
                    $curso = Curso::findorFail($id);
                    $json = array(
                        'status' => 200,
                        'details' => "Curso $id actualizado satifactoriamente",
                        'data' => $curso,
                    );
                    return response()->json($json, 200);
                } catch (\Throwable $th) {
                    $json = array(
                        'status' => 404,
                        'details' => "Curso $id no existe",
                    );
                    return response()->json($json, 404);
                }
            }
        }
        return $this->notAuthorized();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {
        $token = $request->header("Authorization");
        if ($this->isAuthorized($token)) {
            try {
                $id_cliente = $this->getUserJson($token)["id"];
                $curso = Curso::findOrFail($id); //obtengo el curso con el id
                if (!empty($curso)) {
                    if ($curso["id_cliente"] !== $id_cliente) {
                        $json = array(
                            'status' => 404,
                            'details' => "No tiene permiso de ver este curso",
                        );
                        return response()->json($json, 201);
                    }
                    Curso::destroy($id);
                    $json = array(
                        'status' => 200,
                        "details" => "Curso $id eliminado correctamente",
                    );
                    return response()->json($json, 200);
                }
            } catch (\Throwable $th) {
                $json = array(
                    'status' => 404,
                    'details' => "No existe el curso $id",
                );
                return response()->json($json, 404);
            }
        }
        return $this->notAuthorized();
    }
}
