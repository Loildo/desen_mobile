import 'package:flutter/material.dart';

class AgendamentoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recupera o ID do usuário passado como argumento
    final int userId = ModalRoute.of(context)!.settings.arguments as int;
    print('ID usuario em agendamento: $userId');
    
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
            
            ElevatedButton(
              onPressed: () {
                // Passa o ID do usuário para a tela de serviço
                Navigator.pushNamed(context, '/servico', arguments: userId);
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

  void _deslogarUsuario(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
