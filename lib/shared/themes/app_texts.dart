import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleText {
  static final titleHome = GoogleFonts.ptSans(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.laranja
  );

  static final titleLogin = GoogleFonts.lato(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.preto
  );
  static final bottomLogin = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.background,
  );
}
