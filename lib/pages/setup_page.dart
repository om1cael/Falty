import 'package:falty/controllers/setup_page_controller.dart';
import 'package:falty/widgets/number_input_field.dart';
import 'package:flutter/material.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final SetupPageController setupPageController = SetupPageController();

  @override
  void dispose() {
    setupPageController.dispose();
    super.dispose();
  }

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
                  label: 'Dias letivos',
                  hint: '200',
                  helper: 'No Brasil, o mínimo é de 200 dias',
                  suffix: 'dias',
                  length: 3,
                  controller: setupPageController.daysController,
                ),
                SizedBox(height: 24,),
                NumberInputField(
                  label: 'Limite de faltas',
                  hint: '25',
                  helper: 'No Brasil, o limite é de 25%',
                  suffix: '%',
                  length: 2,
                  controller: setupPageController.limitController,
                ),
                SizedBox(height: 32,),
                Column(
                  spacing: 10,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
                        if(setupPageController.validate()) {
                          bool successSave = await setupPageController.save();
                          if(successSave) {
                            // go to next screen
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Eita, não deu pra salvar. Quer tentar de novo?'))
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Preencha os campos corretamente.'))
                          );
                        }
                      }, 
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
                    ),
                    Text(
                      'Pode relaxar, seus dados ficam guardados só no seu aparelho.',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}