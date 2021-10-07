import 'package:dangnhapdoimau/second_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(new FormValidation());

class FormValidation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Form validation",
      home: LoginScreen(),
      routes: {
        SecondScreen.routeName:(context) =>  SecondScreen(),
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State <LoginScreen> {
  late final Function? feedback;
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late bool _isButtonDisabled =false;

  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
          title: new Text("Login")
      ),
      body: new Container(
          padding: const EdgeInsets.all(20.0),
          child: formSetup(context)
      ),
    );
  }

  Widget formSetup(BuildContext context){
    return new Form(
      key: _formKey,
      child: new Column(
        children: <Widget>[
          new TextFormField(
            decoration: InputDecoration(
                hintText: "aa@bb.com",
                labelText: "Email"
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (val){
              if (val!.length == 0 &&  val.length<= 16)
                return "Please enter email and input email";
              else if (!val.contains("@"))
                return "Please enter valid email";
              else
                return null;
            },
            onSaved: (val)=>_email=val!,
          ),
          new TextFormField(
            decoration: InputDecoration(
                hintText: "Password",
                labelText: "Password"
            ),
            obscureText: true,
            validator: (val){
              if (val!.length == 0)
                return "Please enter password";
              else if (val.length >= 8 && val.length<= 16 )
                return "Mật khẩu của bạn phải lớn hơn 8  kí tự và nhỏ hơn 16 kí tự";
              else
                return null;
            },
            onSaved: (val)=>_password=val!,
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CheckboxListTile(
              title: Text("Ghi nhớ đăng nhập"),
              checkColor: Colors.white,
                     value: isChecked,
                       onChanged: (bool? value) {
                    setState(() {
                        isChecked = value!;
                        _isButtonDisabled=value;
                                  });
                                   },
                                     ),

          ),
           new Padding(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          new RaisedButton(
            child: new Text("Submit"),

            onPressed: (){
              if (_formKey.currentState!.validate() && isChecked == true && _isButtonDisabled==true) {
                _formKey.currentState!.save();

                _scaffoldKey.currentState!.showSnackBar(new SnackBar(
                  content: new Text("Your email: $_email and Password: $_password"),
                  duration: Duration(minutes: 1),


                ));
              }
            },
            color:  _isButtonDisabled ? Colors.deepOrange: Colors.brown ,
            highlightColor: Colors.blueGrey,
          )
        ],
      ),
    );
  }
}