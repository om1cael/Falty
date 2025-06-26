import 'package:falty/widgets/number_input_field.dart';
import 'package:flutter/material.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9D71E8),
      appBar: AppBar(
        backgroundColor: Color(0xff9D71E8),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Text(
                  'E aí!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 64
                  ),
                ),
                Text(
                  'A gente só precisa de algumas informações pra você ficar por dentro das faltas. Vai ser bem rapidinho!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24,),
                NumberInputField(
                  label: 'Dias de aula',
                  hint: '200',
                  helper: 'No Brasil, o mínimo é de 200 dias',
                  suffix: 'dias',
                  length: 3,
                ),
                SizedBox(height: 24,),
                NumberInputField(
                  label: 'Limite',
                  hint: '25',
                  helper: 'No Brasil, o limite é de 25%',
                  suffix: '%',
                  length: 2,
                ),
                SizedBox(height: 32,),
                ElevatedButton.icon(
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 50)
                  ),
                  label: Text(
                    'Tô pronto!',
                    style: TextStyle(
                      color: Color(0xff9381FF)
                    ),
                  ),
                  icon: Icon(Icons.arrow_forward),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}