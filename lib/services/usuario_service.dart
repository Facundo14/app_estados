import 'package:flutter/material.dart';
import 'package:app_estados/models/usuario.dart';

class UsuarioService with ChangeNotifier {
  Usuario _usuario = Usuario();

  Usuario get usuario => _usuario;

  bool get existeUsuario => _usuario != null ? true : false;

  set usuario(Usuario user) {
    _usuario = user;
    notifyListeners();
  }

  set edad(int edad) {
    _usuario.edad = edad;
    notifyListeners();
  }

  void removeUser() {
    _usuario = Usuario();
    notifyListeners();
  }

  void agregarProfesion() {
    _usuario.profesiones.add('Profesion ${usuario.profesiones.length + 1}');
    notifyListeners();
  }
}
