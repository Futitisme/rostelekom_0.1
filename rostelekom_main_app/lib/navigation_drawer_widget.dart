import 'package:flutter/material.dart';

import 'package:rostelekom_main_app/pages/contacts_page.dart';
import 'package:rostelekom_main_app/pages/events_page.dart';
import 'package:rostelekom_main_app/pages/history_page.dart';
import 'package:rostelekom_main_app/pages/plans_page.dart';
import 'package:rostelekom_main_app/pages/prof_page.dart';
import 'package:rostelekom_main_app/pages/report_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromRGBO(119, 0, 255, 1),
        child: ListView(
          children: <Widget>[
            //Здесь должен быть билд хедера
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'ПРОФСОЮЗ',
                    icon: Icons.play_lesson_sharp,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const Divider(color: Colors.white),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'История',
                    icon: Icons.event,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Отчеты',
                    icon: Icons.photo,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Планы',
                    icon: Icons.schedule,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const Divider(color: Colors.white),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'МЕРОПРИЯТИЯ',
                    icon: Icons.account_tree_outlined,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  // const SizedBox(height: 16),
                  // buildMenuItem(
                  //   text: 'Вопросы',
                  //   icon: Icons.question_answer,
                  //   onClicked: () => selectedItem(context, 5),
                  // ),
                  // const SizedBox(height: 16),
                  // buildMenuItem(
                  //   text: 'История',
                  //   icon: Icons.history_edu,
                  //   onClicked: () => selectedItem(context, 6),
                  // ),
                  const Divider(color: Colors.white),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'КОНТАКТЫ',
                    icon: Icons.contact_page,
                    onClicked: () => selectedItem(context, 7),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              const CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfPage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HistoryPage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ReportPage(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const PlansPage(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EventsPage(),
        ));
        break;
      // case 5:
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => const QuestionsPage(),
      //   ));
      //   break;
      // case 6:
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => const HistoryPage(),
      //   ));
      //   break;
      case 7:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ContactsPage(),
        ));
        break;
    }
  }
}
