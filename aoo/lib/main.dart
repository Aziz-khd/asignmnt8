import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  String ind = "abc";

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Valid test"),
        leading: Icon(Icons.home),
      ),
      //body
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              //styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              CircleAvatar(
                radius: 70,
                child: Image(
                    image: NetworkImage(
                        "https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png")),
              ),

              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Please enter your email",
                    label: Text(
                      "Email",
                      style: TextStyle(fontSize: 25),
                    ),
                    prefixIcon: Icon(Icons.people)),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[aziz@gmail.com]+").hasMatch(value!)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
              ),

              //box styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              //text input
              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Please enter your password",
                    label: Text(
                      "password",
                      style: TextStyle(fontSize: 25),
                    ),
                    prefixIcon: Icon(Icons.people)),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {},
                obscureText: true,
                validator: (value) {
                  if (value!.contains("ffd")) {
                    return 'Enter a valid password!';
                  }
                  return null;
                },
                maxLines: 1,
                maxLength: 20,
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),

              ElevatedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                onPressed: () => _submit(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
