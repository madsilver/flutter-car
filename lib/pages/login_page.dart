import 'package:flutter/material.dart';
import 'package:fluttercar/widgets/app_button.dart';
import 'package:fluttercar/widgets/app_input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tLogin = TextEditingController();
  final _tPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _focusPass = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cars"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppInput(
              "Login",
              "Digite o login",
              controller: _tLogin,
              validator: _validateLogin,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusPass,
            ),
            SizedBox(height: 20),
            AppInput("Senha", "Digite a senha",
                controller: _tPass,
                password: true,
                validator: _validatePass,
                keyboardType: TextInputType.number,
                focusNode: _focusPass),
            SizedBox(height: 20),
            AppButton("Login", onPressed: _onClickLogin),
          ],
        ),
      ),
    );
  }

  String _validateLogin(String text) {
    return text.isEmpty ? "Digite o login" : null;
  }

  String _validatePass(String text) {
    if (text.length < 3) {
      return "A senha deve ter no mínimo 3 caracteres";
    }
    return text.isEmpty ? "Digite a senha" : null;
  }

  void _onClickLogin() {
    if (!_formKey.currentState.validate()) {
      return;
    }
  }
}
