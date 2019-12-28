import 'package:flutter/material.dart';
import 'package:prueba_1/src/models/persona_model.dart';
import 'package:prueba_1/src/providers/persona_provider.dart';

class HomePage extends StatelessWidget {

  final personasProvider = new PersonasProvider();
  final style_font = TextStyle(fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persona'),
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }
    Widget _crearListado() {
    return FutureBuilder(
      future: personasProvider.cargarPersonas(),
      builder: (BuildContext context, AsyncSnapshot<List<Persona>> snapshot){
        if (snapshot.hasData) {
          final personas = snapshot.data;
          return ListView.builder(            
            itemCount: personas.length,
            itemBuilder: (context, i) => _crearItem(context, personas[i]),
          );
        } else {
          return Center(child:  CircularProgressIndicator());
        }
      },
    );
  }

    Widget _crearItem(BuildContext context, Persona persona) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direccion) {
        personasProvider.borrarPersona(persona.sId);
      },
      child: Card(
        child: Column(
          children: <Widget>[ 
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
                child: ListTile(
                  title: Text('${persona.name.first} ${persona.name.last}', style: style_font),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(persona.pictures[0].url),
                  ),
                  onTap: () => Navigator.pushNamed(context, 'persona_page', arguments: persona),
              ),
            ),
          ],
        ),
      )
    );
  } 

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'persona_page'),
    );
  }

}