import 'package:flutter/material.dart';
import 'package:rostelekom_main_app/form_page_statement.dart';
import 'package:rostelekom_main_app/pages/history_page.dart';
import 'package:rostelekom_main_app/pages/plans_page.dart';
import 'package:rostelekom_main_app/pages/report_page.dart';

class ProfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ПРОФСОЮЗ'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 79, 18, 1),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('lib/assets/images/prof1.png'),
            Row(
              children: [
                Text(
                  'Что дает нам ПРОФСОЮЗ?',
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    "Значимость этих проблем настолько очевидна, что внедрение современных методик является качественно новой ступенью своевременного выполнения сверхзадачи.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  child: Text('История'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return HistoryPage();
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    // Background color
                    onPrimary: Colors.black,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                    elevation: 0,
                    // Elevation
                    shadowColor: Colors.white, // Shadow Color
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  child: Text('Отчеты'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ReportPage();
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    // Background color
                    onPrimary: Colors.black,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                    elevation: 0,
                    // Elevation
                    shadowColor: Colors.white, // Shadow Color
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  child: Text('Планы'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return PlansPage();
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    // Background color
                    onPrimary: Colors.black,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                    elevation: 0,
                    // Elevation
                    shadowColor: Colors.white, // Shadow Color
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                child: Text('Подать заявку'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return FormPageStatement();
                    }),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(119, 0, 255, 1),
                  // Background color
                  onPrimary: Colors.white,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                  elevation: 0,
                  // Elevation
                  shadowColor: Colors.white, // Shadow Color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
