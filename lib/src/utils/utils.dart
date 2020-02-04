import 'package:flutter/material.dart';
import 'package:prueba_1/src/models/persona_model.dart';
import 'package:prueba_1/src/providers/persona_provider.dart';

bool isNumeric(String s) {
  if (s.isEmpty) return false;

  final n = num.tryParse(s);

  return (n == null) ? false : true;
}

void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Información incorrecta'),
          content: Text(mensaje),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}

final personasProvider = new PersonasProvider();
final styleFont = TextStyle(fontWeight: FontWeight.bold);
Persona persona = new Persona();
