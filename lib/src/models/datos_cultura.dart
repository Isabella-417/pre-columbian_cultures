class DatosCultura {
  String nombre;
  String imagenMenu;
  Map<String, dynamic> ubicacion;
  Map<String, dynamic> gobernador;

  DatosCultura(nombre, ubicacion, gobernador, imagenMenu){
    this.nombre = nombre;
    this.ubicacion = ubicacion;
    this.gobernador = ubicacion;
    this.imagenMenu = imagenMenu;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nombre'] = this.nombre;
    data["imagenMenu"] = this.imagenMenu;
    data['ubicacion'] = this.ubicacion;
    data['gobernador'] = this.gobernador;
    return data;
  }


    @override
  String toString() {
    return '"nombre" : { "imagenMenu": $imagenMenu,  "nombre": $nombre, "ubicacion": $ubicacion, "gobernador": $gobernador}';
  }
}