import 'package:flutter/material.dart';
import 'package:helpdeskport/shared/themes/app_colors.dart';
import 'package:helpdeskport/shared/themes/app_images.dart';
import 'package:helpdeskport/shared/themes/app_texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? tipochamadoselecionado;

  var tipochamado = [
    'Sistema',
    'Manutenção',
    'Rede'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.laranja,
        title: const Text('Port Informatica'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.04),
            Center(
              child: Image.asset(
                AppImages.logo,
                height: size.height * 0.15,
              ),
            ),
            Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.03), //espaco entre a logo
                  Align(
                    alignment: const Alignment(-0.8, 0.1),
                    child: Text(
                      "Abrir Chamado:",
                      style: StyleText.titleLogin,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(
              width: size.width * 0.90,
              child: Column(
                children: [
                  Material(
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isDense: true,
                            isExpanded: true,
                            value: tipochamadoselecionado,
                            onChanged: (newValue) {
                              setState(() {
                                tipochamadoselecionado = newValue as String?;
                              });
                            },
                            hint: const Text(
                              "Selecione o Tipo de chamado",
                              style: TextStyle(color: Colors.black),
                            ),
                            items: tipochamado.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
              SizedBox(height: size.height * 0.02),
              SizedBox(
              width: size.width * 0.90,
              child: Column(
                children: [
                  Material(
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isDense: true,
                            isExpanded: true,
                            value: tipochamadoselecionado,
                            onChanged: (newValue) {
                              setState(() {
                                tipochamadoselecionado = newValue as String?;
                              });
                            },
                            hint: const Text(
                              "Selecione o Tipo de chamado",
                              style: TextStyle(color: Colors.black),
                            ),
                            items: tipochamado.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
              SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }
}
