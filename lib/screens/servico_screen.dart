import 'package:flutter/material.dart';

class ServicoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  final int userId = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      backgroundColor: Color(0xff5271ff),
      body: SafeArea(
        child: Stack(
          children: [
            
            Center(
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
                  
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/porte',
                        arguments: {
                          'servico': 'Banho',
                          'userID': userId
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
                  
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/porte',
                        arguments: {
                          'servico': 'Tosa',
                          'userID': userId
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

            
            Positioned(
              top: 20,
              left: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
