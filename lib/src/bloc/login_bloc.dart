import 'dart:async';

import 'package:formvalidation/src/bloc/validators.dart';

class LoginBloc with Validators{
  // stream nos va a servir para controlar flujo y cambios en las propiedades de niveles bajos
  
  final _emailController = StreamController<String>.broadcast();

  Stream<String>get emailStream => _emailController.stream.transform(validarEmail);

  Function(String) get changeEmail => _emailController.sink.add; // crear un referencia

  dispose(){
    _emailController?.close();
  }
}