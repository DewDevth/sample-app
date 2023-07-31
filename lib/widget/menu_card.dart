import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuCard extends StatelessWidget {
  String? title;
  String? subtitle;
  String? event;
  String? img;

  MenuCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.event,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    var color = 0xff453658;
    return Container(
      decoration: BoxDecoration(
          color: Color(color), borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            img.toString(),
            width: 42,
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            title.toString(),
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            subtitle.toString(),
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.white38,
                    fontSize: 10,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            event.toString(),
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
