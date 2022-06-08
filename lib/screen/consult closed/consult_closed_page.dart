import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../shared/themes/app_colors.dart';

class ConsultClosed extends StatefulWidget {
  const ConsultClosed({Key? key}) : super(key: key);

  @override
  State<ConsultClosed> createState() => _ConsultClosedState();
}

class _ConsultClosedState extends State<ConsultClosed> {
  final Stream<QuerySnapshot> chamados =
      FirebaseFirestore.instance.collection('chamadosfechados').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.laranja,
        title: const Text('Chamados Fechados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Chamados Fechados',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: 500,
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
                      return Text(
                        'Chamado do tipo: ${data.docs[index]['tipo']}\n para a categoria:${data.docs[index]['categoria']}\n com criticidade ${data.docs[index]['criticidade']}\n Observação: ${data.docs[index]['observacao']}\n Data de Abertura: ${data.docs[index]['createdAt']}\n Data de Fechamento: ${data.docs[index]['closedAt']}\n',
                        style: const TextStyle(
                          fontSize: 15,
                        ),
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
