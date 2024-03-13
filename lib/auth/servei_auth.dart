import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServeiAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // fer login
  Future<UserCredential> loginAmbEmailIPassword(String email, password) async {
    try {
      UserCredential credencialUsuari = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credencialUsuari;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    } }
    // fer registre
  Future<UserCredential> registreAmbEmailIPassowrd (String email, password) async {
    try {
      UserCredential credencialUsuari = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);


  _firestore.collection("Usuaris").doc(credencialUsuari.user!.uid).set({
    "uid": credencialUsuari.user!.uid,
    "email": email,
    "parametreX": "Hola",
    });
      return credencialUsuari;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
    // fer logout

    
  }

  Future<void> tancarSessio() async {
    return await _auth.signOut();
  }
}
