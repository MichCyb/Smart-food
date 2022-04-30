import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constanti.dart';
import 'package:email_validator/email_validator.dart';
import 'package:smart_food/constanti.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  final _nomeCont = TextEditingController();
  final _cognomeCont = TextEditingController();
  final _dataCont = TextEditingController();
  final _emailCont = TextEditingController();
  bool _emailIsValid = false;
  final _emailValCont = TextEditingController();
  bool _emailValIsValid = false;
  final _passCont = TextEditingController();
  bool _isPassVisible = false;
  final _passValCont = TextEditingController();
  bool _isPassValVisible = false;

  String _dataN = "";

  Widget _NomeBuilder() {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     mainAxisAlignment: MainAxisAlignment.start,
     children: <Widget>[
       const SizedBox(
         height: 10.0,
       ),
       Container(
         alignment: Alignment.centerLeft,
         height: 50,
         decoration: kBoxDecorationStyle,
         child: TextFormField(
           controller: _cognomeCont,
           keyboardType: TextInputType.name,
           style: const TextStyle(
             color: Colors.black,
             fontFamily: 'OpenSans',
           ),
           decoration: const InputDecoration(
             border: InputBorder.none,
             contentPadding: EdgeInsets.only(top: 14.0),
             prefixIcon: Icon(
               Icons.account_circle,
               color: Colors.black,
             ),
             hintText: "Nome",
             hintStyle: kHintTextStyle,
           ),
         ),
       ),
     ],
    );
  }

  Widget _CognomeBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            controller: _nomeCont,
            keyboardType: TextInputType.name,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              hintText: "Cognome",
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _DateBuilder() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50,
      decoration: kBoxDecorationStyle,
      child: TextFormField(
        controller: _dataCont,
        keyboardType: TextInputType.datetime,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'OpenSans',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.date_range,
            color: Colors.black,
          ),
          hintText: "01/01/1999",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _NazioneBuilder() {
    //DROPDOWN LIST - PROVA
    return Container(
      alignment: Alignment.centerLeft,
      height: 50,
      decoration: kBoxDecorationStyle,
      child: TextFormField(
        keyboardType: TextInputType.text,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'OpenSans',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.place,
            color: Colors.black,
          ),
          hintText: "Nazione",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _EmailBuilder() {
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

  Widget _EmailValBuilder() {
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
            controller: _emailValCont,
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
              hintText: "Reinserisci la tua Email",
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

  Widget _PasswordValBoxBuilder() {
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
            controller: _passValCont,
            obscureText: !_isPassValVisible,
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
                    _isPassValVisible = !_isPassValVisible;
                  });
                },
                icon: _isPassValVisible ? Icon(Icons.visibility, color: Colors.black,) : Icon(Icons.visibility_off, color: Colors.black,),
              ),
              hintText: "Reinserisci la tua Password",
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

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
                  fit: BoxFit.cover
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
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
                    "Registrazione",
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
                  _NomeBuilder(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _CognomeBuilder(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _DateBuilder(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _NazioneBuilder(),
                  const SizedBox(
                    height: 50.0,
                  ),
                  _EmailBuilder(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _EmailValBuilder(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _PasswordBoxBuilder(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _PasswordValBoxBuilder(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
