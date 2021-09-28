import 'package:app_estados/models/usuario.dart';
import 'package:app_estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return (snapshot.hasData)
              ? InformacionUsuario(usuario: snapshot.data!)
              : const Center(child: Text('No hay informacion del usuario'));
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
            ListTile(title: Text('Profesion 1: ')),
            ListTile(title: Text('Profesion 2: ')),
            ListTile(title: Text('Profesion 3: ')),
          ],
        ),
      ),
    );
  }
}
