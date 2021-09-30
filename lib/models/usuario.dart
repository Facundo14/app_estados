class Usuario {
  String nombre;
  int edad;
  List<String> profesiones;

  Usuario({this.edad = 0, this.nombre = '', profesiones}) : profesiones = profesiones ?? [];
}
