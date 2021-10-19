import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool yukleniyor = false;
  final _formAnahtari = GlobalKey<FormState>();
  final _scaffoldAnahtari =
      GlobalKey<ScaffoldState>(); //snack için state kontrolu
  String kullaniciAdi, email, sifre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldAnahtari,
      appBar: AppBar(
        title: Text("Hesap Oluştur"),
      ),
      body: ListView(
        children: <Widget>[
          yukleniyor
              ? LinearProgressIndicator()
              : SizedBox(
                  height: 0.0,
                ), //düz çizgi şeklinde yükleniyor
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: _formAnahtari,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: "Kullanıcı adınızı girin",
                        labelText: "Kullanıcı Adı:",
                        errorStyle: TextStyle(fontSize: 16.0),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (girilenDeger) {
                        if (girilenDeger.isEmpty) {
                          return "Kullanıcı adı boş bırakılamaz!";
                        } else if (girilenDeger.trim().length < 4 ||
                            girilenDeger.trim().length > 10) {
                          return "En az 4 en fazla 10 karakter olabilir!";
                        }
                        return null;
                      },
                      onSaved: (girilenDeger) => kullaniciAdi = girilenDeger,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email adresinizi girin",
                        labelText: "Mail:",
                        errorStyle: TextStyle(fontSize: 16.0),
                        prefixIcon: Icon(Icons.mail),
                      ),
                      validator: (girilenDeger) {
                        if (girilenDeger.isEmpty) {
                          return "Email alanı boş bırakılamaz!";
                        } else if (!girilenDeger.contains("@")) {
                          return "Girilen değer mail formatında olmalı!";
                        }
                        return null;
                      },
                      onSaved: (girilenDeger) => email = girilenDeger,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Şifrenizi girin",
                        labelText: "Şifre:",
                        errorStyle: TextStyle(fontSize: 16.0),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (girilenDeger) {
                        if (girilenDeger.isEmpty) {
                          return "Şifre alanı boş bırakılamaz!";
                        } else if (girilenDeger.trim().length < 4) {
                          return "Şifre 4 karakterden az olamaz!";
                        }
                        return null;
                      },
                      onSaved: (girilenDeger) => sifre = girilenDeger,
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      width: double.infinity, // yatay eksende sonsuzluk
                      child: FlatButton(
                        onPressed: () {
                          print("Bilgi Tıklandı");
                        },
                        child: Text(
                          "Hesap Oluştur",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
