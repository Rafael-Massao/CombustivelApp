import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Gasolinaapp(),
));

class Gasolinaapp extends StatefulWidget{
  @override
  _GasolinaappState createState() => _GasolinaappState();
}

class _GasolinaappState extends State<Gasolinaapp>{
  
  static const Color corFundo = Color(0xFF001D3D);
  static const Color corCard = Color(0xFF003566);
  static const Color corPrimaria = Color(0xFFD00000);
  static const Color corSecundaria = Color(0xFFFFB347);
  static const Color corTexto = Color(0xFFFFD60A);
  static const Color corTextoCinza = Color(0xFFE0E1DD);
  static const Color corBorda = Color(0xFFFFD60A);

  final TextEditingController _gasolinaController = TextEditingController();
  final TextEditingController _etanolController = TextEditingController();

  String _resultado = "";

void _calcular(){
  final double gasolina = double.tryParse(_gasolinaController.text) ?? 0;
  final double etanol = double.tryParse(_etanolController.text) ?? 0;
  final double coef = etanol/gasolina;
  final String coefString = coef <= 0.7 ? 'Etanol' : 'Gasolina';
  final String coefStringDecimal = coef.toStringAsFixed(2);

  if (etanol <= 0 && gasolina <= 0){
      setState(() {
        _resultado = 'Informe o valor dos combustiveis';
      });
      return;
    }else if (etanol < 0 || gasolina < 0){
      setState(() {
        _resultado = 'informe o valor dos combustiveis';
      });
      return;
    }
    setState(() {
      _resultado = 'O coeficiente é $coefStringDecimal\n''O melhor combustivel para abastecer é: $coefString';
    });
}

 @override
  Widget build(BuildContext context){
    return Scaffold( 
      backgroundColor: corFundo,

      appBar: AppBar(
        backgroundColor: corCard,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Bem-vindo a calculadora de Combustivel. ⛽",
          style: TextStyle(
            color: corSecundaria,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [

            SizedBox(height: 16,),
            
            SizedBox(height: 36),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: corCard,
                borderRadius: BorderRadius.circular(16),
                // border: Border.all(color: corBorda, width: 1),
              ),  
            child: Text(
              "Informe os valores do combustivel",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: corTextoCinza,
                height: 1.5,
              ),
            ),
            ),
            
            SizedBox(height: 28),
            _buildCampo(
              controller: _gasolinaController,
              label: 'Valor da Gasolina',
              icone: Icons.local_gas_station,
            ),
            SizedBox(height: 16),
            _buildCampo(
              controller: _etanolController,
              label: 'Valor do etanol',
              icone: Icons.local_gas_station,
              ),
            SizedBox(height: 16,),
            
            ElevatedButton(
              onPressed: _calcular, 
              style: ElevatedButton.styleFrom(
                backgroundColor: corPrimaria,
                foregroundColor: Colors.white,
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(14)
                ),
                elevation: 6,
                shadowColor: corPrimaria.withOpacity(0.5),
              ),
              child: Text(
                'Calcular',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                ),
              ),
              SizedBox(height: 36,),
              if (_resultado.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: corCard,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      // color: corBorda,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: corSecundaria.withOpacity(0.2),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ]
                  ),
                  child: Column(children: [
                    Text(
                      "Você vai precisar de: ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: corPrimaria,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      _resultado,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        height: 2.0,
                        color:corTexto, 
                      ),
                    )
                  ],),
                ),
          ],
        ),
      ),
    );
  }
  Widget _buildCampo({
  required TextEditingController controller,
  required String label,
  required IconData icone,
}) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    style: TextStyle(color: corTexto, fontSize: 16),
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: corTextoCinza),
      prefixIcon: Icon(icone, color: corPrimaria,),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        // borderSide: BorderSide(color: corBorda, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: corPrimaria, width: 2),
      ),
      filled: true,
      fillColor: corCard,
    ),
  );
}
}