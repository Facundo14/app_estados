class Usuario {
  final String nombre;
  final int edad;
  final List<String> profesiones;

  Usuario({this.edad = 0, this.nombre = '', profesiones}) : profesiones = profesiones ?? [];

  Usuario copyWith({
    String? nombre,
    int? edad,
    List<String>? profesiones,
  }) =>
      Usuario(
        nombre: nombre ?? this.nombre,
        edad: edad ?? this.edad,
        profesiones: profesiones ?? this.profesiones,
      );
}
