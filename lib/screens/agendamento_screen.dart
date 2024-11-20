import 'package:flutter/material.dart';

class AgendamentoScreen extends StatelessWidget {

  // Função de deslogar o usuário
  void _deslogarUsuario(BuildContext context) {
    print("sair");
    // Aqui você deve colocar sua lógica de deslogar o usuário.
    // Exemplo com FirebaseAuth (deslogando o usuário):
    // FirebaseAuth.instance.signOut();
    
    // Exemplo com SharedPreferences:
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();

    // Após deslogar, redireciona para a tela inicial de login (por exemplo)
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5271ff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pet Feliz',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            // Botão de Agendamento
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/servico');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xff5271ff),
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Agendamento',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            // Botão de Valores
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/valores');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xff5271ff),
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Valores',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            // Botão de Sair
            ElevatedButton(
              onPressed: () => _deslogarUsuario(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xff5271ff),
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Sair',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
