import 'package:app_estados/bloc/usuario/usuario_cubit.dart';
import 'package:app_estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
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
                  usuarioCubit.seleccionarUsuario(
                    Usuario(
                      nombre: 'Facundo Tanovich',
                      edad: 31,
                      profesiones: ['Tecnico', 'Nose que mas'],
                    ),
                  );
                },
              ),
              MaterialButton(
                child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () => usuarioCubit.cambiarEdad(45),
              ),
              MaterialButton(
                child: const Text('Añadir profesión', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () => usuarioCubit.agregarProfesion(),
              )
            ],
          ),
        ));
  }
}
