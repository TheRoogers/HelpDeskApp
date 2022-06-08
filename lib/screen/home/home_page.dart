import 'package:flutter/material.dart';
import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_images.dart';
import '../../shared/themes/app_texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.laranja,
        title: const Text('Port Informatica'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.02),
            Image.asset(
              AppImages.logo,
              height: size.height * 0.15,
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              'Help Desk',
              style: StyleText.titleLogin,
            ),
            SizedBox(height: size.height * 0.15),
            ElevatedButton(
              child: const Text('Abrir chamado'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  //tamanho do botao
                  horizontal: 80,
                  vertical: 20,
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
             SizedBox(height: size.height * 0.10),
            ElevatedButton(
              child: const Text('Chamados em Aberto'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  //tamanho do botao
                  horizontal: 60,
                  vertical: 20,
                ),
                primary: AppColors.laranja,
                elevation: 15,
                onPrimary: Colors.white,
                textStyle: StyleText.bottomLogin,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/consultpage');
              },
            ),
            SizedBox(height: size.height * 0.10),
            ElevatedButton(
              child: const Text('Chamados Fechados'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  //tamanho do botao
                  horizontal: 60,
                  vertical: 20,
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
        ),
      ),
    );
  }
}
