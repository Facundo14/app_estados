part of 'usuario_bloc.dart';

@immutable
class UsuarioState {
  final String nombre;
  final int edad;
  final List<String> profesiones;
  final bool existeUsuario;
  final Usuario usuario;

  UsuarioState({this.nombre = '', this.edad = 0, profesiones, usuario, this.existeUsuario = false})
      : usuario = usuario ?? Usuario(),
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

  UsuarioState initState() => UsuarioState(
        existeUsuario: false,
        usuario: null,
      );
}

class UsuarioInitial extends UsuarioState {}
