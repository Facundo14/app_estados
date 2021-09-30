import 'package:get/get.dart';
import 'package:app_estados/models/usuario.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  var usuario = Usuario().obs;

  int get profesionesCount => usuario.value.profesiones.length;

  void cargarUsuario(Usuario usuario) {
    existeUsuario.value = true;
    this.usuario.value = usuario;
  }

  void cambiarEdad(int edad) {
    usuario.update((val) {
      val!.edad = edad;
    });
  }

  void agregarProfesion(String profesion) {
    usuario.update((val) {
      val!.profesiones = [...val.profesiones, profesion];
    });
  }
}
