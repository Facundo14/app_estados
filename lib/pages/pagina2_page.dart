import 'package:app_estados/models/usuario.dart';
import 'package:app_estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: StreamBuilder<Usuario>(
              stream: usuarioService.usuarioStream,
              builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
                return snapshot.hasData ? Text(snapshot.data!.nombre) : const Text('Pagina 2');
              }),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: _asignarUsuario,
              ),
              MaterialButton(
                child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  usuarioService.cambiarEdad(25);
                },
              ),
              MaterialButton(
                child: const Text('Añadir profesión', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {},
              )
            ],
          ),
        ));
  }

  _asignarUsuario() {
    final nuevoUsuario = Usuario(nombre: 'Facundo', edad: 31, profesiones: [
      'Tecnico',
      'Programador',
      'Nose que más',
    ]);
    usuarioService.cargarUsuario(nuevoUsuario);
  }
}
