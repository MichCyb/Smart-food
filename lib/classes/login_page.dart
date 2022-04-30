import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_food/classes/register_page.dart';
import '../constanti.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  final _emailCont = TextEditingController();
  bool _emailIsValid = false;
  final _passCont = TextEditingController();

  bool _rememberMe = false;
  bool _isPassVisible = false;

  Widget _EmailBoxBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            controller: _emailCont,
            validator: (email) {
              if (email != null && EmailValidator.validate(email))
                return null;
              else
                return "L'Email è sbagliata";
            },
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,),
              hintText: "Email",
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _PasswordBoxBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[/*
        const Text(
          'Password',
          style: kLabelStyle,
        ),*/
        const SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            controller: _passCont,
            obscureText: !_isPassVisible,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isPassVisible = !_isPassVisible;
                  });
                },
                icon: _isPassVisible ? Icon(Icons.visibility, color: Colors.black,) : Icon(Icons.visibility_off, color: Colors.black,),
              ),
              hintText: "Password",
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print('Password dimenticata?'),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.only(right: 0.0),
        ),
        child: const Text(
          'Password Dimenticata?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.black,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          const Text(
            'Ricordami',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5.0,
          padding: const EdgeInsets.all(13.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          primary: Colors.white,
        ),
        onPressed: () {
          _emailIsValid = EmailValidator.validate(_emailCont.text);
          if (_emailCont.text == "" || _passCont.text == ""){
            print("Credenziali non inserite");
            Fluttertoast.showToast(
              msg: "Inserisci le credenziali",
              textColor: toastColorError,
              backgroundColor: toastBackColorError,
              timeInSecForIosWeb: 1,
              fontSize: 16.0,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
          } else {
            if (!_emailIsValid){
              print("Credenziali non corrette");
              Fluttertoast.showToast(
                msg: "Credenziali non corrette",
                textColor: toastColorError,
                backgroundColor: toastBackColorError,
                timeInSecForIosWeb: 1,
                fontSize: 16.0,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
            } else {
              //Se le credenziali sono giuste sintatticamente, si procede con il login
              /*
              * LOGIN
              * */
              //Si passa alla home
            }
          }
        },
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        Navigator
         .push(
          context,
          MaterialPageRoute(builder: (context) => RegisterPage())
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Non hai un Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = null,
              text: 'Registrati',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //Widget uno sopra l'altro
        children: [
          //Vari figli
          Container(
            height: double.infinity, //Tutto schermo
            width: double.infinity, //Tutto schermo
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/food_login_back.jpg"),
                  fit: BoxFit.cover),
              /*gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF00FF96),
                  Color(0xFF00ff73),
                  Color(0xFF00FF4C),
                  Color(0xFF00ff40),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),*/
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Smart Food",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _EmailBoxBuilder(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _PasswordBoxBuilder(),
                  _buildForgotPasswordBtn(),
                  _buildRememberMeCheckbox(),
                  _buildLoginBtn(),
                  _buildSignupBtn(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
