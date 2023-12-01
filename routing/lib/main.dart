import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FirstPage());
  }
}

class FirstPage extends StatelessWidget {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final fullNameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[400],
        title: Text(
          'Log in Form',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: Icon(
          Icons.code,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(padding: EdgeInsets.all(40), children: [
          Text(
            'Welcome Back!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: fullNameController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Full Name',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email Address',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                minimumSize: Size(128, 40),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        HomePage(name: fullNameController.text)));
              },
              child: Text(
                'Log in',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              )),
        ]),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  String? name;
  HomePage({super.key, this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.yellow[400],
            title: Text(
              'Homepage',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            leading: Icon(
              Icons.code,
              color: Colors.black,
            ),
            centerTitle: true,
            actions: [
              GestureDetector(
                  child: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FirstPage()));
                  })
            ]),
        body: Center(
            child: Text(
          "Welcome ${widget.name}!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )));
  }
}

class Person {
  String? name;

  Person({this.name});
}
