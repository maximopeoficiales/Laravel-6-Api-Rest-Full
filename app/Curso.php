<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Curso extends Model
{
    protected $table = "cursos";
    protected $fillable = ["titulo", "descripcion", "instructor", "imagen", "precio", "id_cliente", "updated_at", "created_at"];
}
