import 'package:flutter/material.dart';


void main(){
  runApp(
    const FirstApp()
  );
}

class FirstApp extends StatelessWidget {
  const FirstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Контакти'),
              backgroundColor: Colors.green,
            ),
            body: const AppContent(),
              )

    );
  }
}

class AppContent extends StatefulWidget{
  const AppContent({super.key});
  @override
  MyAppContent createState(){
    return MyAppContent();
  }
}

class MyAppContent extends State<AppContent>{
  final controller = TextEditingController(text: 'Ярослава Шит');
  @override
  Widget build(BuildContext context) {
    return Form(
        child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      color: Colors.green,
                      height: 310,
                      child: const Image(
                        height: 300,
                        width: 600,
                        image: AssetImage('images/photo.jpg'),
                      ),
                    ),
                    const Padding(
                      padding:  EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                      child:  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Ім\'я та Прізвище'),
                    ),
                    ),
                    TextField(
                        controller: controller,
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                          onPressed: () {
                            var a = CheckInput(controller.text);
                            var message = 'Введіть дані коректно';
                            if (a.correct ){
                              message = 'Збережено';
                            }
                            showDialog(
                                context: context,
                                builder: (context){
                                  return AlertDialog(
                                    content: Text(message),
                                  );
                            });
                          },
                          child: const Text('Зберегти')),
                     )]
                ),
        ),
    );
  }
  }

class CheckInput{
  var _name;
  bool correct = true;
  CheckInput(String name){
    this.name = name;
  }
  String get name=> _name;

  set name(String name){
    if (name.isEmpty || name.contains(RegExp(r'[\d!@#$%^&*()_+=`<>?/"]'))){
      correct = false;
    }
    else{
      _name = name;
    }
  }
}