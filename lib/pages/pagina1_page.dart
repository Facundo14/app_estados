import 'package:app_estados/bloc/usuario/usuario_bloc.dart';
import 'package:app_estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (_, UsuarioState state) {
          if (!state.existeUsuario) {
            return const Center(child: CircularProgressIndicator());
          }
          return InformacionUsuario(usuario: state.usuario);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_sharp),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Text('General', style: TextStyle(fontSize: size.width * 0.05, fontWeight: FontWeight.bold)),
            const Divider(),
            ListTile(title: Text('Nombre: ${usuario.nombre}')),
            ListTile(title: Text('Edad: ${usuario.edad}')),
            Text('Profesiones', style: TextStyle(fontSize: size.width * 0.05, fontWeight: FontWeight.bold)),
            const Divider(),

            ...usuario.profesiones.map((profesion) => ListTile(title: Text(profesion))).toList()

            //const ListTile(title: Text('Profesion 1')),
          ],
        ),
      ),
    );
  }
}
