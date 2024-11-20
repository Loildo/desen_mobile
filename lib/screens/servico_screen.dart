import 'package:flutter/material.dart';

class ServicoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5271ff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Agendamento',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            // Botão Banho
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/porte',
                  arguments: {
                    'servico': 'Banho', // Passando o serviço selecionado
                  },
                );
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
                'Banho',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            // Botão Tosa
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/porte',
                  arguments: {
                    'servico': 'Tosa', // Passando o serviço selecionado
                  },
                );
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
                'Tosa',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
