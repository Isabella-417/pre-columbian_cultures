class LaberintoDatos {
  String imagenPersonaje;
  String imagenMeta;
  int filas;
  int columnas;
  String mensajeMeta;

  LaberintoDatos(String imagenPersonaje,String imagenMeta,int filas,int columnas,String mensajeMeta) {
    this.imagenPersonaje = imagenPersonaje;
    this.imagenMeta = imagenMeta;
    this.filas = filas;
    this.columnas = columnas;
    this.mensajeMeta = mensajeMeta;
  }

  @override
  String toString() {
    return '"nombre" : { imagen_personaje": $imagenPersonaje, "imagen_meta": $imagenMeta,  "filas": $filas, "columnas": $columnas, "mensaje_meta": $mensajeMeta}';
  }
}
