import 'package:flutter/material.dart';

class ValoresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5271ff), 
      body: SafeArea(
        child: Stack(
          children: [
            
            Column(
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
                  'Valores',
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
                        
                        Text(
                          'Banho',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff5271ff),
                          ),
                        ),
                        SizedBox(height: 10),

                        
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
                        
                        Text(
                          'Tosa',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff5271ff),
                          ),
                        ),
                        SizedBox(height: 10),

                        
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
