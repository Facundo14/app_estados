import 'package:app_estados/models/usuario.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState()) {
    on<OnEsablecerUsuario>(_onEstablecerUsuario);
    on<OnEstablecerEdad>(_onEstablecerEdad);
  }

  void _onEstablecerUsuario(OnEsablecerUsuario event, Emitter<UsuarioState> emit) {
    emit(
      state.copyWith(
        existeUsuario: true,
        usuario: event.usuario,
      ),
    );
  }

  void _onEstablecerEdad(OnEstablecerEdad event, Emitter<UsuarioState> emit) {
    emit(state.copyWith(
      usuario: state.usuario.copyWith(
        edad: event.edad,
      ),
    ));
  }
}