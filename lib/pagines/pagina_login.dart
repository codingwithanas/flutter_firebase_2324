import 'package:flutter/material.dart';
import 'package:flutter_firebase_2324/auth/servei_auth.dart';
import 'package:flutter_firebase_2324/components/boto_auth.dart';
import 'package:flutter_firebase_2324/components/textfield_auth.dart';

class PaginaLogin extends StatefulWidget {
  final void Function() alFerClic;

  const PaginaLogin({super.key, required this.alFerClic});

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  Future<void> ferLogin(BuildContext context) async {

    final serveiAuth = ServeiAuth();


    try {

      await serveiAuth.loginAmbEmailIPassword(
      controllerEmail.text, 
      controllerPassword.text);

    } catch (e) {

      // ignore: use_build_context_synchronously
      showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(e.toString()),
      ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 183, 159),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo.
                const Icon(
                  Icons.fireplace,
                  size: 120,
                  color: Color.fromARGB(255, 255, 240, 218),
                ),

                const SizedBox(
                  height: 25,
                ),

                // Frase.
                const Text(
                  "Benvingut/da de nou",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 240, 218),
                    fontSize: 18,
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                // Text Divisori.
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 255, 240, 218),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        child: Text(
                          "Fes login",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 240, 218),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 255, 240, 218),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                // TextField Email.
                TextFieldAuth(
                  controller: controllerEmail,
                  obscureText: false,
                  hintText: "Email",
                ),

                const SizedBox(
                  height: 25,
                ),

                // TextField Password.
                TextFieldAuth(
                  controller: controllerPassword,
                  obscureText: true,
                  hintText: "Contraseña",
                ),

                const SizedBox(
                  height: 25,
                ),

                // No estás registrat/da?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("No ets membre?"),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: widget.alFerClic,
                        child: const Text(
                          "Registrat't",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 71, 97),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                // Botó Login.
                BotoAuth(
                  text: 'Login',
                  onTap: () => ferLogin(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
