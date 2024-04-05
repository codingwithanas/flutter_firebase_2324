import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_2324/auth/login_o_registre.dart';
import 'package:flutter_firebase_2324/auth/portal_auth.dart';
import 'package:flutter_firebase_2324/firebase_options.dart';
import 'package:flutter_firebase_2324/pagines/pagina_login.dart';
import 'package:flutter_firebase_2324/pagines/pagina_registre.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PortalAuth(),
    );
  }
}
/*
1) Tenir el Node.js instal·lat.
2) npm install -g firebase-tools
3) Fer login a Firebase: firebase login
    - Si dona error de l'arxiu firebase.ps1, canviar-li el nom (o esborrar-lo
    i tornar a fer login).
    - Si tornem a fer firebase login, ens diu en quin compte estem.
    - Si vulguéssim canviar el compte, fem firebase logout.
4) Fer: dart pub global activate flutterfire_cli
5) Vincular projecte local amb projecte Firebase de la Consola.
    - flutterfire configure
6) Incloure les llibreries de Firebase que vulguem utilitzar.
    - flutter pub add firebase_auth
    - flutter pub add firebase_core
*/

/*
Imatges:
========
1) Habilitar Firebase Storage en el projecte vinculat de Firebase.
  - Es pot posar les reglas a true el write i read.
2) Descarreguem dependència de Firebase Storage al projecte.
  - flutter pub add firebase_storage
3) Desccarreguem una dependència per seleccionar imatges (un picker).
  - N'hi ha diversos.
  - Fem servir el image_picker
    - flutter pub add image_picker
4) Perquè funcioni en Android:
  - Anar a android > app > src > main > AndroidManifest.xml
    Escriure just abans del tag <aplication> (fora d'aplication):
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.READ_MEDIA_IMAGES"/>
    <uses-permission android:name="android.permission.READ_MEDIA_VIDEO"/>
*/