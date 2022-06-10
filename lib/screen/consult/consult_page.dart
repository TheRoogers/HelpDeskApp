import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_texts.dart';

class ConsultPage extends StatefulWidget {
  const ConsultPage({Key? key}) : super(key: key);

  @override
  State<ConsultPage> createState() => _ConsultPageState();
}

class _ConsultPageState extends State<ConsultPage> {
  final Stream<QuerySnapshot> chamados =
      FirebaseFirestore.instance.collection('chamados').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.laranja,
        title: const Text('Chamados em Aberto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Chamados em Aberto',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: 250,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: StreamBuilder<QuerySnapshot>(
                stream: chamados,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong.');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading');
                  }

                  final data = snapshot.requireData;
                  return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text(
                            'Chamado do tipo: ${data.docs[index]['tipo']}\n para a categoria:${data.docs[index]['categoria']}\n com criticidade ${data.docs[index]['criticidade']}\n Observação: ${data.docs[index]['observacao']}\n Data de Abertura: ${data.docs[index]['createdAt']}\n',
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          ElevatedButton(
                            child: const Text('Fechar'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                //tamanho do botao
                                horizontal: 10,
                                vertical: 10,
                              ),
                              primary: AppColors.laranja,
                              elevation: 15,
                              onPrimary: Colors.white,
                              textStyle: StyleText.bottomLogin,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/consultclosed');
                            },
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
