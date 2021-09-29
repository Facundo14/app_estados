import 'package:app_estados/models/usuario.dart';
import 'package:app_estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
        appBar: AppBar(
          title: usuarioService.existeUsuario ? Text(usuarioService.usuario.nombre) : const Text('Pagina 2'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  final newUsuario = Usuario(
                    edad: 31,
                    nombre: 'Facundo Tanovich',
                    profesiones: [
                      'Tecnico',
                      'Programador',
                      'Nose que mas',
                    ],
                  );
                  usuarioService.usuario = newUsuario;
                },
              ),
              MaterialButton(
                child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () => usuarioService.edad = 25,
              ),
              MaterialButton(
                child: const Text('Añadir profesión', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () => usuarioService.agregarProfesion(),
              )
            ],
          ),
        ));
  }
}
