import 'package:flutter/material.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  with SingleTickerProviderStateMixin{

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500), vsync: this,);
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(()=> this.setState((){}));
    _iconAnimationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return new  Scaffold(
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/photo.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                      color: Colors.teal,
                      fontSize: 20.0,
                      )
                    )
                  ),
                child: new Container(
                  padding: const EdgeInsets.all(60.0),
                    child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter Email"

                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    new TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter Password"
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),   
                    new Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                    ),
                    new MaterialButton(
                      height: 40.0,
                      minWidth: 100.0,
                      color: Colors.teal,
                      textColor: Colors.white,
                      child: new Text("Login"),
                    onPressed: () => {},
                    splashColor: Colors.tealAccent,
                    )
                    ],
              ),
                ),
                ),
                
              )
            ],
          )
        ],
      ),
    );
  }
}