import 'package:app_estados/bloc/usuario/usuario_cubit.dart';
import 'package:app_estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () => usuarioCubit.borrarUsuario(),
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_sharp),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UsuarioInitial:
            return const Center(child: Text('No hay informacion del usuario'));
          case UsuarioActivo:
            return InformacionUsuario(usuario: (state as UsuarioActivo).usuario);
          default:
            return const CircularProgressIndicator();
        }
        // if (state is UsuarioInitial) {
        //   return const Center(child: Text('No hay informacion del usuario'));
        // } else if (state is UsuarioActivo) {
        //   return InformacionUsuario(usuario: state.usuario);
        // } else {
        //   return const CircularProgressIndicator();
        // }
      },
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
            ...usuario.profesiones
                .map((profesion) => ListTile(
                      title: Text(profesion),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
