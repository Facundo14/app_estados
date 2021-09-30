import 'package:app_estados/bloc/usuario/usuario_bloc.dart';
import 'package:app_estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UsuarioBloc>(context);
    //final usuarioBloc = context.read<UsuarioBloc>();
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
                    final newUser = Usuario(nombre: 'Facundo', edad: 32, profesiones: ['asd', 'asd', 'asd']);

                    userBloc.add(OnEsablecerUsuario(newUser));

                    // usuarioBloc.add(OnEsablecerUsuario(newUser));
                  }),
              MaterialButton(
                  child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                  onPressed: () => userBloc.add(OnEstablecerEdad(35))),
              MaterialButton(
                child: const Text('Añadir profesión', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () => userBloc.add(OnEstablecerProfesion('Nueva')),
              )
            ],
          ),
        ));
  }
}
