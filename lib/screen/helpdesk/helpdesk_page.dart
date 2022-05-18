import 'package:flutter/material.dart';
import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_texts.dart';

class HelpDeskPage extends StatefulWidget {
  const HelpDeskPage({Key? key}) : super(key: key);

  @override
  State<HelpDeskPage> createState() => _HelpDeskPageState();
}

class _HelpDeskPageState extends State<HelpDeskPage> {
  int _value = 0;
  List<String> tipoChamado = ['Sistema', 'Manutenção', 'Rede'];
  List<String> chamadoSistema = ['Senha', 'Acesso', 'Configuração'];
  List<String> chamadoManutencao = ['Troca de peça', 'Impressora', 'Limpeza'];
  List<String> chamadoRede = [
    'Sem Acesso a Internet',
    'Internet Lenta',
    'Senha Wifi'
  ];

  List<String> categoriaChamado = [];
  String? selectedtipoChamado;
  String? selectedcategoriaChamado;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.laranja,
        title: const Text('Chamado'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Form(
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.02), //espaco entre a logo
                Row(
                  children: [
                    Text(
                      "Abrir Chamado:",
                      textDirection: TextDirection.ltr,
                      style: StyleText.titleLogin,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: size.height * 0.02),

          // Chamado Dropdown
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
                      child: DropdownButton<String>(
                        hint: const Text(
                          "Selecione o Tipo de chamado",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        value: selectedtipoChamado,
                        isDense: true,
                        isExpanded: true,
                        items: tipoChamado.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (chamado) {
                          if (chamado == 'Sistema') {
                            categoriaChamado = chamadoManutencao;
                          } else if (chamado == 'Manutenção') {
                            categoriaChamado = chamadoSistema;
                          } else if (chamado == 'Rede') {
                            categoriaChamado = chamadoRede;
                          } else {
                            categoriaChamado = [];
                          }
                          setState(() {
                            selectedcategoriaChamado = null;
                            selectedtipoChamado = chamado;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // tipo chamado Dropdown Ends here

          SizedBox(height: size.height * 0.02),

          // Categoria Dropdown
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
                      child: DropdownButton<String>(
                        hint: const Text(
                          "Categoria",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        value: selectedcategoriaChamado,
                        isExpanded: true,
                        isDense: true,
                        items: categoriaChamado.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (categoria) {
                          setState(() {
                            selectedcategoriaChamado = categoria;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // categoria Dropdown Ends here
          SizedBox(height: size.height * 0.01),
          Row(
            children: [
              Text(
                "Selecione a criticidade:",
                textDirection: TextDirection.ltr,
                style: StyleText.titleLogin,
              ),
            ],
          ),

          // criticidade
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (_) {
                      setState(
                        () {
                          _value = 1;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    width: 0.0,
                  ),
                  const Text("Baixa")
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (_) {
                      setState(
                        () {
                          _value = 2;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    width: 0.0,
                  ),
                  const Text("Media")
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 3,
                    groupValue: _value,
                    onChanged: (_) {
                      setState(
                        () {
                          _value = 3;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    width: 0.0,
                  ),
                  const Text("Alta")
                ],
              ),
            ],
          ),
          // fim da criticidade
          Row(
            children: [
              Text(
                "Descreva sua duvida: ",
                textDirection: TextDirection.ltr,
                style: StyleText.titleLogin,
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          //texfield
          Row(
            children: [
              Form(
                child: SizedBox(
                  width: size.width * 0.89,
                  child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        elevation: 15,
                        shadowColor: AppColors.cinza,
                        child: TextField(
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(
                              fontSize: 16.0,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.cinza),
                            ),
                            hintText: 'Observações...',
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          maxLines: 7,
                          minLines: 7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //fim texfield
          SizedBox(height: size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text('Salvar'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    //tamanho do botao
                    horizontal: 40,
                    vertical: 10,
                  ),
                  primary: AppColors.laranja,
                  elevation: 15,
                  onPrimary: Colors.white,
                  textStyle: StyleText.bottomLogin,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/helppage');
                },
              ),
              ElevatedButton(
                child: const Text('Cancelar'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    //tamanho do botao
                    horizontal: 40,
                    vertical: 10,
                  ),
                  primary: AppColors.laranja,
                  elevation: 15,
                  onPrimary: Colors.white,
                  textStyle: StyleText.bottomLogin,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/helppage');
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
