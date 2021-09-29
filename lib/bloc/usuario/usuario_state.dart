part of 'usuario_bloc.dart';

@immutable
class UsuarioState {
  final String nombre;
  final int edad;
  final List<String> profesiones;
  final bool existeUsuario;
  final Usuario usuario;

  UsuarioState({this.nombre = '', this.edad = 0, profesiones, usuario, existeUsuario})
      : usuario = usuario ?? Usuario(),
        existeUsuario = (usuario != null) ? true : false,
        profesiones = profesiones ?? [];

  UsuarioState copyWith({
    String? nombre,
    int? edad,
    List<String>? profesiones,
    bool? existeUsuario,
    Usuario? usuario,
  }) =>
      UsuarioState(
          nombre: nombre ?? this.nombre,
          edad: edad ?? this.edad,
          profesiones: profesiones ?? this.profesiones,
          existeUsuario: existeUsuario ?? this.existeUsuario,
          usuario: usuario ?? this.usuario);

  UsuarioState initState() => UsuarioState();
}

class UsuarioInitial extends UsuarioState {}
