// // funciones para administracion de firebase de la base de datos
// import 'package:cloud_firestore/cloud_firestore.dart';

// FirebaseFirestore db = FirebaseFirestore.instance;

// // funcion que consulte y regrese lista de base de datos
// Future<List> getPeople() async {
//   List people = [];
// // llamado a base de datos
// // hacer referencia a nuestra coleccion o tabla
//   CollectionReference collectionReferencePeople = db.collection('usuarios');

//   QuerySnapshot queryPeople = await collectionReferencePeople.get();

//   queryPeople.docs.forEach((documento) {
//     people.add(documento.data);
//   });
//   return people;
// }
import 'package:cloud_firestore/cloud_firestore.dart';

// Función para consultar a Firestore
Future<void> fetchData() async {
  // Referencia a la colección de usuarios
  final usuarios = FirebaseFirestore.instance.collection('usuarios');

  // Realizar la consulta a Firestore
  QuerySnapshot querySnapshot = await usuarios.get();

  // Iterar sobre los documentos devueltos por la consulta
  querySnapshot.docs.forEach((doc) {
    print(doc.data());
  });
}
