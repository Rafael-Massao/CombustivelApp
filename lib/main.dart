// import - material
import 'package:flutter/material.dart';

// Etapa 1 - Esqueleto da tela
// Objetivo - Entender a estrutura da tela de um app Flutter

void main() => runApp(MaterialApp(
  home: Gasolinaapp(),
));

class Gasolinaapp extends StatelessWidget{
  String _resultado = "";
  void _calcular(){

  }
  @override 
  Widget build(BuildContext context){
    // Esqueleto visual da tela - com a tag <html>
    return Scaffold(  
      // Local onde ficarão a maioria dos nossos elementos 
      
      // Semelhante ao <header>
      appBar: AppBar(
        title: Text("Calculadora de Combustíveis ⛽"),
      ),
    
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Aqui é onde estarão os nossos elementos/widgets
            Text(
              "Bem Vindo à Calculadora de Combutíveis!",
              style: TextStyle(fontSize: 18.0),
            ),
           SizedBox(height: 36.0),

           Text(
              "Informe o tipo do combustível:",
              style: TextStyle(fontSize: 18.0),
           ),
           // Gasolina
            SizedBox(height: 16.0),

            TextField(
              decoration: InputDecoration(
                labelText: "Preço da Gasolina(L):",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
           // Etanol
            SizedBox(height: 16.0),

            TextField(
              decoration: InputDecoration(
                labelText: "Preço do Etanol(L):",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}