import 'package:flutter/material.dart';

class RamosMauroFormulario extends StatefulWidget {
  const RamosMauroFormulario({super.key});

  @override
  State<RamosMauroFormulario> createState() => _RamosMauroFormularioState();
}

class _RamosMauroFormularioState extends State<RamosMauroFormulario> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String usuario = '',
      nombres = '',
      apellidos = '',
      telefono = '',
      direccion = '',
      clave = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Formulario de nuevo usuario",
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(hintText: 'Usuario'),
                  textAlign: TextAlign.center,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu nombre de usuario';
                    }
                    setState(() {
                      usuario = value;
                    });
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(hintText: 'Nombres'),
                  textAlign: TextAlign.center,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tus nombres';
                    }
                    setState(() {
                      nombres = value;
                    });
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(hintText: 'Apellidos'),
                  textAlign: TextAlign.center,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tus apellidos';
                    }
                    setState(() {
                      apellidos = value;
                    });
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(hintText: 'Teléfono'),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu número de teléfono';
                    }
                    setState(() {
                      telefono = value;
                    });
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(hintText: 'Dirección'),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu dirección';
                    }
                    setState(() {
                      direccion = value;
                    });
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
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
                    setState(() {
                      clave = value;
                    });

                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(
                          'Información ingresada: \nUsuario:$usuario - Nombres:$nombres - Apellidos:$apellidos - Teléfono:$telefono - Dirección:$direccion - Clave:$clave');
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: const Text(
                    "Guardar usuario",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
