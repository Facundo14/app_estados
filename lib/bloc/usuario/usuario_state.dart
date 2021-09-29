part of 'usuario_cubit.dart';

@immutable
abstract class UsuarioState {}

class UsuarioInitial extends UsuarioState {
  final existeUsuario = false;

  //como se va a ver en la consola las propiedades del UsuarioInitial
  // @override
  // String toString() {
  //   return 'UsuarioInicial: existeUsuario: false';
  // }
}

class UsuarioActivo extends UsuarioState {
  final existeUsuario = true;
  final Usuario usuario;

  UsuarioActivo(usuario) : usuario = usuario ?? Usuario();
}

