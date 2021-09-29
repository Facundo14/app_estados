import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:app_estados/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () => usuarioService.removeUser(),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: (usuarioService.usuario.nombre != '' && usuarioService.usuario.edad >= 0)
          ? const InformacionUsuario()
          : const Center(
              child: Text('No hay informacion del usuario'),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_sharp),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
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
            ListTile(title: Text('Nombre: ' + usuarioService.usuario.nombre)),
            ListTile(title: Text('Edad ' + usuarioService.usuario.edad.toString())),
            Text('Profesiones', style: TextStyle(fontSize: size.width * 0.05, fontWeight: FontWeight.bold)),
            const Divider(),
            ...usuarioService.usuario.profesiones.map((profesion) => ListTile(title: Text(profesion))).toList()

            //const ListTile(title: Text('Profesion 1')),
          ],
        ),
      ),
    );
  }
}
