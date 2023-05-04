import 'package:flutter/material.dart';
import 'package:rostelekom_main_app/details_profpage.dart';

class FormPageStatement extends StatefulWidget {
  const FormPageStatement({Key? key}) : super(key: key);

  @override
  State<FormPageStatement> createState() => _MyFormStateStatement();
}

class _MyFormStateStatement extends State<FormPageStatement> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _mailController = TextEditingController();
  final _aboutController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _mailController.dispose();
    _aboutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(119, 0, 255, 1),
            title: const Text("Заявка"),
            centerTitle: true),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              MyTextField(
                  myController: _nameController,
                  fieldName: "Имя",
                  myIcon: Icons.account_box_outlined,
                  prefixIconColor: Color.fromRGBO(119, 0, 255, 1)),
              const SizedBox(height: 10.0),
              //Use to add space between Textfields
              MyTextField(
                  myController: _surnameController,
                  fieldName: "Фамилия",
                  myIcon: Icons.account_box_outlined,
                  prefixIconColor: Color.fromRGBO(119, 0, 255, 1)),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _mailController,
                  fieldName: "Адрес электронной почты",
                  myIcon: Icons.contact_mail_outlined,
                  prefixIconColor: Color.fromRGBO(119, 0, 255, 1)),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _aboutController,
                  fieldName: "Немного о себе",
                  myIcon: Icons.add_comment_outlined,
                  prefixIconColor: Color.fromRGBO(119, 0, 255, 1)),
              const SizedBox(height: 20.0),
              myBtn(context),
            ],
          ),
        ));
  }

  //Function that returns OutlinedButton Widget also it pass data to Details Screen
  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        if (_nameController.text == '' &&
            _surnameController.text == '' &&
            _mailController.text == '') {
          print('nothing');
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return Details_ProfPage(
                name: _nameController.text,
                surname: _surnameController.text,
                mail: _mailController.text,
                about: _aboutController.text,
              );
            }),
          );
        }
      },
      child: Text(
        "Отправить заявку".toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Color.fromRGBO(119, 0, 255, 1)),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = const Color.fromRGBO(119, 0, 255, 1),
  });

  final TextEditingController myController;
  String fieldName;
  final IconData myIcon;
  Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
          labelText: fieldName,
          prefixIcon: Icon(myIcon, color: prefixIconColor),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(119, 0, 255, 1)),
          ),
          labelStyle: const TextStyle(color: Color.fromRGBO(119, 0, 255, 1))),
    );
  }
}
