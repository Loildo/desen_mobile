import 'package:flutter/material.dart';
import '../database/database_helper.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  
  void _validarLogin() async {
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (email.isEmpty || senha.isEmpty) {
      _mostrarErro('Por favor, preencha todos os campos.');
      return;
    }

    try {
      DatabaseHelper dbHelper = DatabaseHelper();
      int? userId = await dbHelper.buscarIdUsuarioPorEmailSenha(email, senha);

      if (userId != null) {
        // Login bem-sucedido, redireciona para a próxima tela com o ID
        print('Usuário logado com ID: $userId');
        Navigator.pushNamed(context, '/agendamento', arguments: userId);
      } else {
        // Credenciais incorretas
        _mostrarErro('Email ou senha incorretos.');
      }
    } catch (e) {
      print(e);
      _mostrarErro('Erro ao verificar login: $e');
    }
  }



  
  void _mostrarErro(String mensagem) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Erro'),
          content: Text(mensagem),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


  
  bool _isFormValid() {
    return _emailController.text.isNotEmpty && _senhaController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f6ff),  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(
              'Pet Feliz',
              style: TextStyle(
                fontSize: 36,
                color: Color(0xff5271ff),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),

            
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Color(0xff5271ff), 
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24),
                  
                  TextFormField(
                    controller: _emailController,  
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {}); 
                    },
                  ),
                  SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _senhaController,  
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    obscureText: true,
                    onChanged: (text) {
                      setState(() {}); 
                    },
                  ),
                  SizedBox(height: 24),
                  
                  ElevatedButton(
                    onPressed: _isFormValid() ? _validarLogin : null,  
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,  
                      foregroundColor: Color(0xff5271ff),  
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }
}
