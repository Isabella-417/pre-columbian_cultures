class DatosCultura {
  String nombre;
  String imagenMenu;
  String mito;

  Map<String, dynamic> ubicacion;
  Map<String, dynamic> dioses;
  Map<String, dynamic> sociedad;
  Map<String, dynamic> laberinto;

  DatosCultura(nombre, ubicacion, sociedad, dioses, imagenMenu,laberinto) {
    this.nombre = nombre;
    this.ubicacion = ubicacion;
    this.sociedad = sociedad;
    this.dioses = dioses;
    this.imagenMenu = imagenMenu;
    this.laberinto = laberinto;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nombre'] = this.nombre;
    data['mito'] = this.mito;
    data["imagenMenu"] = this.imagenMenu;

    data['ubicacion'] = this.ubicacion;
    data['sociedad'] = this.sociedad;
    data['dioses'] = this.dioses;
    data['laberinto'] = this.laberinto;
    return data;
  }

  @override
  String toString() {
    return '"nombre" : { mito": $mito, "sociedad": $sociedad,  "dioses": $dioses, "ubicacion": $ubicacion, "laberinto": $laberinto}';
  }
}
