import 'dart:async';

import 'package:app_estados/models/usuario.dart';

class _UsuarioService {
  Usuario _usuario = Usuario();

  // ignore: prefer_final_fields
  StreamController<Usuario> _usuarioStreamController = StreamController<Usuario>.broadcast();

  Usuario get usuario => _usuario;

  // ignore: unnecessary_null_comparison
  bool get existeUsuario => (_usuario != null) ? true : false;
  void cargarUsuario(Usuario user) {
    _usuario = user;
    _usuarioStreamController.add(user);
  }

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  void cambiarEdad(int edad) {
    _usuario.edad = edad;
    _usuarioStreamController.add(_usuario);
  }

  dispose() {
    _usuarioStreamController.close();
  }
}

final usuarioService = _UsuarioService();
