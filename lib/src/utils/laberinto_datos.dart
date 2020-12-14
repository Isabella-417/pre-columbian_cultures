class LaberintoDatos {
  String imagen_personaje;
  String imagen_meta;
  int filas;
  int columnas;
  String mensaje_meta;

  LaberintoDatos(String imagen_personaje,String imagen_meta,int filas,int columnas,String mensaje_meta) {
    this.imagen_personaje = imagen_personaje;
    this.imagen_meta = imagen_meta;
    this.filas = filas;
    this.columnas = columnas;
    this.mensaje_meta = mensaje_meta;
  }

  @override
  String toString() {
    return '"nombre" : { imagen_personaje": $imagen_personaje, "imagen_meta": $imagen_meta,  "filas": $filas, "columnas": $columnas, "mensaje_meta": $mensaje_meta}';
  }
}
