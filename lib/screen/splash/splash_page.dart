import 'package:flutter/material.dart';
import 'dart:async';

import 'package:helpdeskport/shared/themes/app_colors.dart';
import 'package:helpdeskport/shared/themes/app_images.dart';
import 'package:helpdeskport/shared/themes/app_texts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/homepage');
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // centraliza a logo ao meio
          children: <Widget>[
            Image.asset(
              AppImages.banner,
              height: size.height * 0.40, // diminui o seu tamanho
            ),
            Text(
              "Carregando...",
              style: StyleText.titleHome,
            ),
            SizedBox(height: size.height * 0.03),
            const CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(AppColors.laranja),
            ),
          ],
        ),
      ),
    );
  }
}