part of 'usuario_bloc.dart';

@immutable
abstract class UsuarioEvent {}

class OnEsablecerUsuario extends UsuarioEvent {
  final Usuario usuario;

  OnEsablecerUsuario(usuario) : usuario = usuario ?? Usuario();
}

class OnEstablecerEdad extends UsuarioEvent {
  final int edad;

  OnEstablecerEdad(this.edad);
}

class OnEstablecerProfesion extends UsuarioEvent {
  final String profesion;

  OnEstablecerProfesion(this.profesion);
}

class OnBorrarUsuario extends UsuarioEvent {
  OnBorrarUsuario();
}
