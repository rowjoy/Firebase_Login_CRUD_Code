import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFromField extends StatelessWidget {
  final String fildname;
  final TextEditingController controller;
  final String Function(String) validator;
  final Icon prefixIcon;
  final Widget suffixIcon;
  final int maxlanth;
  final bool obsettext;
  const TextFromField({
    Key key,
    this.controller,
    this.fildname,
    this.prefixIcon,
    this.suffixIcon,
    this.maxlanth,
    this.validator,
    this.obsettext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxlanth,
      controller: controller,
      style: GoogleFonts.montserrat(color: Colors.black, fontSize: 15),
      //ignore: missing_return
      validator: validator,
      obscureText: obsettext,

      decoration: InputDecoration(
        hintText: fildname,
        helperStyle: Theme.of(context).textTheme.headline2,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}


