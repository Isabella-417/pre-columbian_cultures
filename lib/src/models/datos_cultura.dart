class DatosCultura {
  String nombre;
  String imagenMenu;
  String mito;

  Map<String, dynamic> ubicacion;
  Map<String, dynamic> dioses;
  Map<String, dynamic> sociedad;

  DatosCultura(nombre, ubicacion, sociedad, dioses, imagenMenu) {
    this.nombre = nombre;
    this.ubicacion = ubicacion;
    this.sociedad = sociedad;
    this.dioses = dioses;
    this.imagenMenu = imagenMenu;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nombre'] = this.nombre;
    data['mito'] = this.mito;
    data["imagenMenu"] = this.imagenMenu;

    data['ubicacion'] = this.ubicacion;
    data['sociedad'] = this.sociedad;
    data['dioses'] = this.dioses;
    return data;
  }

  @override
  String toString() {
    return '"nombre" : { mito": $mito, "sociedad": $sociedad,  "dioses": $dioses, "ubicacion": $ubicacion}';
  }
}
