import 'package:flutter/material.dart';
import 'authorization_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode usernameFocusNode = FocusNode();

  void _clearFieldsAndFocus() {
    usernameController.clear();
    passwordController.clear();
    FocusScope.of(context).requestFocus(usernameFocusNode);
  }

  void _closeApp() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Agregar la imagen en la parte superior de los campos.
            Image.asset(
              'assets/logo.png', // Asegúrate de que la ruta sea correcta.
              width: 150, // Ajusta el ancho de la imagen según tus necesidades.
              height: 150, // Ajusta la altura de la imagen según tus necesidades.
            ),
            SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Usuario',
              ),
              focusNode: usernameFocusNode,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;

                // Verificar si el usuario está autorizado (demostración simple).
                bool isAuthorized = (username == 'usuario' && password == 'contraseña');

                if (isAuthorized) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthorizationPage(
                        isAuthorized: isAuthorized,
                        username: username,
                        password: password,
                      ),
                    ),
                  );
                } else {
                  // Limpiar campos y hacer focus en el campo usuario.
                  _clearFieldsAndFocus();
                }
              },
              child: Text('Iniciar sesión'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _closeApp, // Cerrar la aplicación al presionar el botón.
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Cambiar el color del botón a rojo.
              ),
              child: Text('Cerrar aplicación'),
            ),
          ],
        ),
      ),
    );
  }
}



