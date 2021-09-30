import 'package:app_estados/controllers/usuario_controller.dart';
import 'package:app_estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.find<UsuarioController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagina 2'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                  onPressed: () {
                    usuarioCtrl.cargarUsuario(Usuario(
                      nombre: 'Facundo',
                      edad: 31,
                      profesiones: ['nose'],
                    ));
                    Get.snackbar(
                      'Establecer Usuario',
                      'El usuario fue agregado correctamente',
                      backgroundColor: Colors.white,
                      boxShadows: [
                        const BoxShadow(
                          color: Colors.black38,
                          blurRadius: 10,
                        )
                      ],
                    );
                  }),
              MaterialButton(
                  child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                  onPressed: () {
                    usuarioCtrl.cambiarEdad(32);
                    Get.defaultDialog(title: 'Hola', textConfirm: 'Confirmar', textCancel: 'Cancelar');
                  }),
              MaterialButton(
                child: const Text('Añadir profesión', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () => usuarioCtrl.agregarProfesion('Profesion #${usuarioCtrl.profesionesCount + 1}'),
              ),
              MaterialButton(
                child: const Text('Cambiar Theme', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () => Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark()),
              )
            ],
          ),
        ));
  }
}
