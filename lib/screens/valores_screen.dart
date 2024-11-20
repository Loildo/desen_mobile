import 'package:flutter/material.dart';

class ValoresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5271ff), // Cor de fundo azul #5271ff
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Título "Pet Feliz"
            Text(
              'Pet Feliz',
              style: TextStyle(
                fontSize: 36,
                color: Color(0xfff4f6ff), // Cor do texto #f4f6ff
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Subtítulo "Valores"
            Text(
              'Valores',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xfff4f6ff), // Cor do texto #f4f6ff
              ),
            ),
            SizedBox(height: 20),

            // Box de valores para "Banho"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xfff4f6ff), // Cor do fundo dos boxes #f4f6ff
                  borderRadius: BorderRadius.circular(16), // Bordas arredondadas
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título "Banho"
                    Text(
                      'Banho',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5271ff),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Valores para "Banho"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Porte pequeno',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5271ff),
                          ),
                        ),
                        Text(
                          'R\$ 40,00',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5271ff),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Porte médio',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5271ff),
                          ),
                        ),
                        Text(
                          'R\$ 60,00',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5271ff),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Porte grande',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5271ff),
                          ),
                        ),
                        Text(
                          'R\$ 80,00',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5271ff),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Box de valores para "Tosa"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xfff4f6ff), // Cor do fundo dos boxes #f4f6ff
                  borderRadius: BorderRadius.circular(16), // Bordas arredondadas
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título "Tosa"
                    Text(
                      'Tosa',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5271ff),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Valores para "Tosa"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Porte pequeno',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5271ff),
                          ),
                        ),
                        Text(
                          'R\$ 50,00',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5271ff),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Porte médio',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5271ff),
                          ),
                        ),
                        Text(
                          'R\$ 80,00',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5271ff),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Porte grande',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5271ff),
                          ),
                        ),
                        Text(
                          'R\$ 120,00',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5271ff),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
