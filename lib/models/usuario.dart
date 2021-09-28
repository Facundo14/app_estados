class Usuario {
  String nombre = '';
  int edad = 0;
  List<String> profesiones;

  Usuario({this.edad = 0, this.nombre = '', profesiones}) : profesiones = profesiones ?? [];
}
