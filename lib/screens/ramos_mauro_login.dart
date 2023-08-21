import 'package:flutter/material.dart';

class RamosMauroLogin extends StatefulWidget {
  const RamosMauroLogin({super.key});

  @override
  State<RamosMauroLogin> createState() => _RamosMauroLoginState();
}

class _RamosMauroLoginState extends State<RamosMauroLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Inicio de sesión",
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://img.freepik.com/foto-gratis/fondo-pantalla-telefono-movil-playa-arena-blanca_53876-138183.jpg"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Spacer(),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(hintText: 'Usuario'),
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu nombre de usuario';
                    }
                    if (value != 'admin') {
                      return "Usuario no encontrado";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  obscureText: true,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(hintText: 'Clave'),
                  textAlign: TextAlign.center,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor ingresa tu clave";
                    }
                    if (value != "123") {
                      return "Clave no válida";
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/mapa');
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: const Text(
                        "Ingresar",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/formulario');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: const Text(
                        "Nuevo usuario",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 75,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
