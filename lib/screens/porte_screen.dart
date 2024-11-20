import 'package:flutter/material.dart';

class PorteScreen extends StatefulWidget {
  @override
  _PorteScreenState createState() => _PorteScreenState();
}

class _PorteScreenState extends State<PorteScreen> {
  String? selectedPorte;
  String? servicoSelecionado;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Capturando o argumento enviado da tela anterior
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    if (args != null && args['servico'] != null) {
      setState(() {
        servicoSelecionado = args['servico'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5271ff),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Text(
              'Pet Feliz',
              style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Agendamento', style: TextStyle(fontSize: 28, color: Colors.white)),
            SizedBox(height: 40),
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
                    // Exibindo o serviço selecionado dentro do formulário
                    if (servicoSelecionado != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20), // Um pouco de espaço abaixo
                        child: Text(
                          'Serviço: $servicoSelecionado', // Exibindo "Banho" ou "Tosa"
                          style: TextStyle(fontSize: 22, color: Color(0xff5271ff)),
                        ),
                      ),
                    // Opção Porte Pequeno
                    Row(
                      children: [
                        Checkbox(
                          value: selectedPorte == 'Pequeno',
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                selectedPorte = 'Pequeno';
                              } else {
                                selectedPorte = null;
                              }
                            });
                          },
                          activeColor: Color(0xff5271ff),
                        ),
                        Text('Porte pequeno', style: TextStyle(fontSize: 18, color: Color(0xff5271ff))),
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
                                selectedPorte = 'Medio';
                              } else {
                                selectedPorte = null;
                              }
                            });
                          },
                          activeColor: Color(0xff5271ff),
                        ),
                        Text('Porte Medio', style: TextStyle(fontSize: 18, color: Color(0xff5271ff))),
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
                                selectedPorte = 'Grande';
                              } else {
                                selectedPorte = null;
                              }
                            });
                          },
                          activeColor: Color(0xff5271ff),
                        ),
                        Text('Porte grande', style: TextStyle(fontSize: 18, color: Color(0xff5271ff))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            // Botões "Voltar" e "Próximo" na mesma linha
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alinha os botões
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Voltar para a tela anterior
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    ),
                    child: Text(
                      'Voltar',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: selectedPorte != null
                        ? () {
                            // Passa o valor selecionado para a tela de HorarioScreen
                            Navigator.pushNamed(
                              context,
                              '/horario',
                              arguments: selectedPorte, // Passando o porte como argumento
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5271ff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    ),
                    child: Text(
                      'Próximo',
                      style: TextStyle(fontSize: 18, color: selectedPorte != null ? Colors.white : Color(0xff5271ff)),
                    ),
                  ),
                ],
              ),
            ),
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
