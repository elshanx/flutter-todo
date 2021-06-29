import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  List<String> todoList = ['SLAAM'];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('TODOS'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return Text(todoList[index]);
                },
              ),
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(hintText: 'enter some shit'),
                onChanged: (value) => print(value),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print(_textEditingController.text);
                  setState(() {
                    if (_textEditingController.text.trim().length > 0) {
                      todoList.add(_textEditingController.text);
                      _textEditingController.text = '';
                    } else {
                      print('length 0');
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
                child: Text('submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
