import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:lottie/lottie.dart';

class Details_ProfPage extends StatelessWidget {
  Details_ProfPage(
      {Key? key,
      required this.name,
      required this.surname,
      required this.mail,
      required this.about})
      : super(key: key);

  String name, surname, mail, about;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 79, 18, 1),
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/fon.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: TextButton(
                child: Text('Вернуться назад'),
                onPressed: () {
                  sendEmail(name, surname, mail, about);
                  Navigator.of(context)
                    ..pop()
                    ..pop();
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

            //Lottie.asset('assets/animations/done.json'),
          ],
        ),
      ),
    );
  }

  Future sendEmail(name, surname, mail, about) async {
    final service_id = 'service_w1e3z2n';
    final template_id = 'template_chuykda';
    final user_id = 'G9hbb_8POo50ZC0gN';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    try {
      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': service_id,
          'template_id': template_id,
          'user_id': user_id,
          'template_params': {
            'user_name': name,
            'user_surname': surname,
            'user_mail': mail,
            'to_mail': 'motyavvs8@gmail.com',
            'user_about': about,
          },
        }),
      );
      print(response.body);
    } catch (error) {}
  }
}
