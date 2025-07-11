import 'package:falty/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int maxAllowedAbsences = 0;
  int totalAbsences = 0;
  int remainingAbsences = 0;
  double absencePercentageUsed = 0;

  bool isLoading = true;

  final HomePageController homePageController = HomePageController();
  final DateTime now = DateTime.now();

  final months = {
    1: 'janeiro',
    2: 'fevereiro',
    3: 'março',
    4: 'abril',
    5: 'maio',
    6: 'junho',
    7: 'julho',
    8: 'agosto',
    9: 'setembro',
    10: 'outubro',
    11: 'novembro',
    12: 'dezembro'
  };

  @override
  void initState() {
    super.initState();
    updateValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9D71E8),
        title: Text(
          'Falty',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context, 
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Estamos trabalhando nisso!'),
                    content: Text('Opa, parece que você achou uma funcionalidade que ainda está em desenvolvimento :)'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        }, 
                        child: Text(
                          "Beleza!",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      )
                    ],
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    contentTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                    backgroundColor: Color(0xff9381FF),
                  );
                }
              );
            }, 
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            )
          )
        ],
      ),
      backgroundColor: Color(0xff9D71E8),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Opa, tudo tranquilo?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 56
                          ),
                        ),
                        Text(
                          'Hoje são ${now.day} de ${months[now.month]}.',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                            fontSize: 20
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 107, 66, 177),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Você pode faltar até $maxAllowedAbsences dias.',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            ),
                            Text(
                              'Já faltou: $totalAbsences',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 14
                              ),
                            ),
                            Text(
                              'Restam: $remainingAbsences',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 14
                              ),
                            ),
                            SizedBox(height: 20,),
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(12),
                                  child: LinearProgressIndicator(
                                    backgroundColor: Colors.white,
                                    value: absencePercentageUsed.clamp(0, 1),
                                    minHeight: 6,
                                    color: Color(0xffFF5C5C),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  'Você usou ${(absencePercentageUsed * 100).round()}% do seu limite',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton.icon(
                        onPressed: () async {
                          await homePageController.saveAbsence();
                          updateValues();
                        },
                        label: Text(
                          'Registrar falta de hoje',
                          style: TextStyle(
                            color: Color(0xff9381FF)
                          ),
                        ),
                        icon: Icon(Icons.add),
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        await homePageController.removeAbsence();
                        updateValues();
                      },
                      label: Text(
                        'Remover falta de hoje',
                        style: TextStyle(
                          color: Color(0xff9381FF)
                        ),
                      ),
                      icon: Icon(Icons.remove),
                    ),
                  ],
                ),
              ),
            ),
          ),

          if(isLoading) (
            Container(
              color: Color(0xff9D71E8),
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
          )
        ],
      )
    );
  }

  Future<void> updateValues() async {
    int max = await homePageController.getMaxAbsences() ?? 0;
    int total = await homePageController.getAbsences() ?? 0;

    setState(() {
      maxAllowedAbsences = max;
      totalAbsences = total;
      remainingAbsences = maxAllowedAbsences - totalAbsences;
      absencePercentageUsed = max == 0 ? 0 : totalAbsences / maxAllowedAbsences;
      isLoading = false;
    });
  }
}