import 'package:flutter/material.dart';

class PorteScreen extends StatefulWidget {
  @override
  _PorteScreenState createState() => _PorteScreenState();
}

class _PorteScreenState extends State<PorteScreen> {
  String? selectedPorte;
  String? servicoSelecionado;
  Map? args;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as Map?;
    if (args != null && args!['servico'] != null) {
      setState(() {
        servicoSelecionado = args!['servico'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5271ff),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
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
                        if (servicoSelecionado != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              'Serviço: $servicoSelecionado',
                              style: TextStyle(fontSize: 22, color: Color(0xff5271ff)),
                            ),
                          ),
                        Row(
                          children: [
                            Checkbox(
                              value: selectedPorte == 'Pequeno',
                              onChanged: (bool? value) {
                                setState(() {
                                  selectedPorte = value == true ? 'Pequeno' : null;
                                });
                              },
                              activeColor: Color(0xff5271ff),
                            ),
                            Text('Porte pequeno', style: TextStyle(fontSize: 18, color: Color(0xff5271ff))),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: selectedPorte == 'Medio',
                              onChanged: (bool? value) {
                                setState(() {
                                  selectedPorte = value == true ? 'Medio' : null;
                                });
                              },
                              activeColor: Color(0xff5271ff),
                            ),
                            Text('Porte Médio', style: TextStyle(fontSize: 18, color: Color(0xff5271ff))),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: selectedPorte == 'Grande',
                              onChanged: (bool? value) {
                                setState(() {
                                  selectedPorte = value == true ? 'Grande' : null;
                                });
                              },
                              activeColor: Color(0xff5271ff),
                            ),
                            Text('Porte Grande', style: TextStyle(fontSize: 18, color: Color(0xff5271ff))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: selectedPorte != null
                            ? () {
                                Navigator.pushNamed(
                                  context,
                                  '/horario',
                                  arguments: {
                                    'servico': servicoSelecionado,
                                    'porte': selectedPorte,
                                    'userID': args!['userID'],
                                  },
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
                          style: TextStyle(
                            fontSize: 18,
                            color: selectedPorte != null ? Colors.white : Color(0xff5271ff),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
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
