import 'package:flutter/material.dart';

class PorteScreen extends StatefulWidget {
  @override
  _PorteScreenState createState() => _PorteScreenState();
}

class _PorteScreenState extends State<PorteScreen> {
  // Variável para armazenar qual porte foi selecionado
  String? selectedPorte;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5271ff), // Cor de fundo azul
      body: SafeArea(
        child: Column(
          children: [
            // Adiciona um espaço no topo para centralizar melhor os elementos
            Spacer(),

            // Logo e título "Pet Feliz"
            Text(
              'Pet Feliz',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Título "Agendamento"
            Text(
              'Agendamento',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),

            // Container com as opções de porte
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Opção Porte Pequeno
                    Row(
                      children: [
                        Checkbox(
                          value: selectedPorte == 'Pequeno',
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                selectedPorte = 'Pequeno'; // Seleciona o "Porte Pequeno"
                              } else {
                                selectedPorte = null; // Desmarca se o usuário desmarcar
                              }
                            });
                          },
                          activeColor: Color(0xff5271ff),
                        ),
                        Text(
                          'Porte pequeno',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff5271ff),
                          ),
                        ),
                      ],
                    ),

                    // Opção Porte Médio
                    Row(
                      children: [
                        Checkbox(
                          value: selectedPorte == 'Medio',
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                selectedPorte = 'Medio'; // Seleciona o "Porte Médio"
                              } else {
                                selectedPorte = null; // Desmarca se o usuário desmarcar
                              }
                            });
                          },
                          activeColor: Color(0xff5271ff),
                        ),
                        Text(
                          'Porte Medio',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff5271ff),
                          ),
                        ),
                      ],
                    ),

                    // Opção Porte Grande
                    Row(
                      children: [
                        Checkbox(
                          value: selectedPorte == 'Grande',
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                selectedPorte = 'Grande'; // Seleciona o "Porte Grande"
                              } else {
                                selectedPorte = null; // Desmarca se o usuário desmarcar
                              }
                            });
                          },
                          activeColor: Color(0xff5271ff),
                        ),
                        Text(
                          'Porte grande',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff5271ff),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Espaço entre a lista de checkboxes e o botão "Próximo"
            SizedBox(height: 30),

            // Botão Próximo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: selectedPorte != null
                    ? () {
                        // Redireciona para a tela "/horario"
                        Navigator.pushNamed(context, '/horario');
                      }
                    : null, // Botão desabilitado se nenhum checkbox for selecionado
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5271ff), // Cor de fundo azul
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Próximo',
                  style: TextStyle(
                    fontSize: 18,
                    // Cor do texto do botão depende se está desabilitado ou não
                    color: selectedPorte != null ? Colors.white : Color(0xff5271ff),
                  ),
                ),
              ),
            ),

            // Adiciona um espaço no final para centralizar melhor os elementos
            Spacer(),

            // Pegadas decorativas na parte inferior
            Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.pets, color: Colors.white, size: 30),
                    SizedBox(height: 10),
                    Icon(Icons.pets, color: Colors.white, size: 24),
                    SizedBox(height: 10),
                    Icon(Icons.pets, color: Colors.white, size: 18),
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
