import 'package:flutter/material.dart';
import 'package:flutter_api/screens/forms/Form2.dart';
import 'package:flutter_api/screens/forms/Form3.dart';
import 'package:flutter_api/screens/forms/Form4.dart';
import 'package:flutter_api/screens/forms/Form5.dart';
import 'package:flutter_api/screens/forms/Form6.dart';
import 'package:flutter_api/screens/forms/Form7.dart';
import 'package:flutter_api/screens/todo_list.dart';

import '../../widget/menu_card.dart';
import '../forms/Form.dart';

class GridDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: GridView.count(
      childAspectRatio: 1.0,
      padding: EdgeInsets.only(left: 16, right: 16),
      crossAxisCount: 2,
      crossAxisSpacing: 18,
      mainAxisSpacing: 18,
      children: [
        InkWell(
          child: MenuCard(
            title: "Form",
            subtitle: "รูปแบบ Form ทั้งหมด",
            event: "3 Events",
            img: "assets/images/calendar.png",
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                // builder: (context) => const FormAllPage(),
                // builder: (context) => const CheckBoxExam(),
                // builder: (context) => const Form2(),
                // builder: (context) => const Form4(),
                // builder: (context) => const Form5(),
                // builder: (context) => const Form6(),
                builder: (context) => const Form7(),
              ),
            );
          },
        ),
        MenuCard(
          title: "Groceries",
          subtitle: "Bocali, Apple",
          event: "4 Items",
          img: "assets/images/food.png",
        ),
        MenuCard(
          title: "Locations",
          subtitle: "Lucy Mao going to Office",
          event: "",
          img: "assets/images/map.png",
        ),
        InkWell(
          child: MenuCard(
            title: "Settings",
            subtitle: "",
            event: "2 Items",
            img: "assets/images/setting.png",
          ),
          onTap: () {
            print('click');
          },
        ),
        InkWell(
          child: MenuCard(
            title: "To do",
            subtitle: "Homework, Design",
            event: "4 Items",
            img: "assets/images/todo.png",
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TodoListPage(),
              ),
            );
          },
        ),
      ],
    ));
  }
}
