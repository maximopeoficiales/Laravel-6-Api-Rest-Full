<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
    protected $table = "clientes";
    protected $fillable = ['nombre', "apellido", "id_cliente", "email", "llave_secreta", "updated_at", "created_at"];
}
