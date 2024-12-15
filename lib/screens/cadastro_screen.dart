import 'package:flutter/material.dart';
import '../database/database_helper.dart'; // Importe a classe DatabaseHelper

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  // Função de validação do cadastro
  void _validarCadastro() async {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
      _mostrarAlerta('Campos não preenchidos. Por favor, preencha todos os campos.');
    } else {
      try {
        DatabaseHelper dbHelper = DatabaseHelper();
        await dbHelper.inserirUsuario(nome, email, senha);
        
        _mostrarModalSucesso();
      } catch (e) {
        print(e);
        _mostrarAlerta('Erro ao salvar o cadastro: $e');
      }
    }
  }

  // Função para mostrar alerta de erro
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
                Navigator.of(context).pop(); // Fechar alerta
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Função para mostrar modal de sucesso
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
                Navigator.of(context).pop(); // Fechar modal
                Navigator.pushNamed(context, '/login' ); // Navegar para a tela de login
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Função para deletar o banco de dados
  Future<void> _deletarBanco() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    await dbHelper.deletarBanco();
    _mostrarAlerta('Banco de dados deletado com sucesso. Recrie o banco ao reiniciar o app.');
  }
  Future<void> _listar() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    await dbHelper.listarUsuarios();
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
                  // ElevatedButton(
                  //   onPressed: _deletarBanco,
                  //   // onPressed: _listar,
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.red,
                  //     foregroundColor: Colors.white,
                  //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(25),
                  //     ),
                  //   ),
                  //   child: Text(
                  //     'Deletar Banco',
                  //     style: TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
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
