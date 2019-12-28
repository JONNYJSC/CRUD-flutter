import 'dart:convert';
import 'dart:io';

import 'package:mime_type/mime_type.dart';
import 'package:prueba_1/src/api/webapi_url.dart';
import 'package:prueba_1/src/models/persona_model.dart';
import 'package:http/http.dart' as http;

class PersonasProvider {

  //final String _url = 'https://nodestart.herokuapp.com';
  String _url = WebApi.url_api;

  Future<bool> crearPersona(Persona persona) async {

    final url = '$_url/api/persons';
    final resp = await http.post(url,
    headers: {"content-type": "application/json"},
    body: profileToJson(persona));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }
  String profileToJson(Persona data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

  Future<List<Persona>> cargarPersonas() async {

    final url = '$_url/api/persons';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final PersonModel dataP = new PersonModel.fromJson(decodedData);

    if (decodedData == null) return [];

    return dataP.data;
  }

    Future<bool> editarPersona(Persona persona) async {
    final url = '$_url/api/persons/${persona.sId}';
    final resp = await http.put(url, 
    headers: {"content-type": "application/json"},
    body: profileToJson(persona));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  Future<bool> borrarPersona(String id) async {

    final url   = '$_url/api/persons/$id';
    final resp  = await http.delete(url, headers: {"content-type": "application/json"});
    print(resp.body);
    if (resp.statusCode == 200) {
      return true;
      } else {
        return false;
      }
  }

  /*Future<String> subirImagen(File imagen) async {
    final url = Uri.parse('https://api.cloudinary.com/v1_1/ds9itipvg/image/upload?upload_preset=g5ee325m');
    final mimeType = mime(imagen.path).split('/');

    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );
    final file = await http.MultipartFile.fromPath(
      'file', 
      imagen.path,
      contentType: MediaType(mimeType[0], mimeType[1])
    );
    imageUploadRequest.files.add(file);
    final streangResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streangResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Algo Salio mal');
      print(resp.body);
      return null;
    }

    final respdata = json.decode(resp.body);
    print(respdata);
    return respdata['secure_url'];
  }*/

}