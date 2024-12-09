import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  
  void _validarCadastro() {
    
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;

    
    if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
      
      _mostrarAlerta('Campos não preenchidos. Por favor, preencha todos os campos.');
    } else {
      
      _mostrarModalSucesso();
    }
  }

  
  void _mostrarAlerta(String mensagem) {
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

  
  void _mostrarModalSucesso() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Sucesso'),
          content: Text('Cadastro realizado com sucesso!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                Navigator.pushNamed(context, '/login'); 
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
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
                    'Cadastro',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24),
                  
                  TextFormField(
                    controller: _nomeController,  
                    decoration: InputDecoration(
                      hintText: 'Nome',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  
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
                  ),
                  SizedBox(height: 24),
                  
                  ElevatedButton(
                    onPressed: _validarCadastro,  
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,  
                      foregroundColor: Color(0xff5271ff),  
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'Já tem cadastro? Login',
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
    
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }
}
