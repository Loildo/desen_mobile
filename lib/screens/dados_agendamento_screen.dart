import 'package:flutter/material.dart';

class DadosAgendamentoScreen extends StatefulWidget {
  @override
  _DadosAgendamentoScreenState createState() => _DadosAgendamentoScreenState();
}

class _DadosAgendamentoScreenState extends State<DadosAgendamentoScreen> {
  final TextEditingController _nomePetController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  bool _isMacho = false;
  bool _isFemea = false;

  String? selectedPorte;
  String? selectedHorario;

  bool _isFormValid() {
    
    return _nomePetController.text.isNotEmpty &&
        _idadeController.text.isNotEmpty &&
        (_isMacho || _isFemea) &&
        selectedPorte != null &&
        selectedHorario != null;
  }

  void _enviarFormulario() {
    
    if (_isFormValid()) {
      
      String nomePet = _nomePetController.text;
      String idade = _idadeController.text;
      String sexo = _isMacho ? 'Macho' : 'Fêmea';

      
      String porte = selectedPorte!;
      String horario = selectedHorario!;

      
      print('Enviando Formulário...');
      print('Nome do Pet: $nomePet');
      print('Idade: $idade');
      print('Sexo: $sexo');
      print('Porte: $porte');
      print('Horário: $horario');

      
    } else {
      
      print("Preencha todos os campos obrigatórios.");
    }
  }

  @override
  Widget build(BuildContext context) {
    
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    
    
    selectedPorte = arguments?['porte'] ?? 'Porte '; 
    selectedHorario = arguments?['horario'] ?? 'Horário '; 

    return Scaffold(
      backgroundColor: Color(0xff5271ff), 
      body: SafeArea(
        child: Stack(
          children: [
            
            SingleChildScrollView(  
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  
                  Text(
                    'Pet Feliz',
                    style: TextStyle(
                      fontSize: 36,
                      color: Color(0xfff4f6ff), 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  
                  Text(
                    'Dados de agendamento',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xfff4f6ff), 
                    ),
                  ),
                  SizedBox(height: 20),

                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xfff4f6ff), 
                        borderRadius: BorderRadius.circular(16), 
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Porte: $selectedPorte',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff5271ff),
                                ),
                              ),
                              Text(
                                'Horário: $selectedHorario',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff5271ff),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          
                          Text(
                            'Nome do Pet',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff5271ff),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: _nomePetController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),

                          
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Idade',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff5271ff),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    TextField(
                                      controller: _idadeController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sexo',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff5271ff),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: _isMacho,
                                            onChanged: (bool? newValue) {
                                              setState(() {
                                                _isMacho = newValue ?? false;
                                                _isFemea = false; 
                                              });
                                            },
                                          ),
                                          Text(
                                            'Macho',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff5271ff),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: _isFemea,
                                            onChanged: (bool? newValue) {
                                              setState(() {
                                                _isFemea = newValue ?? false;
                                                _isMacho = false; 
                                              });
                                            },
                                          ),
                                          Text(
                                            'Fêmea',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff5271ff),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          
                          Text(
                            'Obs:',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff5271ff),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: _isFormValid() ? _enviarFormulario : null, 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, 
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), 
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          ),
                          child: Text(
                            'Confirmar',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                             Navigator.pushNamed(
                              context,
                              '/agendamento'
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, 
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), 
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          ),
                          child: Text(
                            'Cancelar',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, bottom: 16.0, top: 20),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.pets, color: Color(0xfff4f6ff), size: 30),
                          SizedBox(width: 10),  
                          Icon(Icons.pets, color: Color(0xfff4f6ff), size: 24),
                          SizedBox(width: 10),  
                          Icon(Icons.pets, color: Color(0xfff4f6ff), size: 18),
                        ],
                      ),
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
