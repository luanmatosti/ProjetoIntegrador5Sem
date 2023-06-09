import 'package:echo_project/home.dart';
import 'package:echo_project/register.dart';
import 'package:echo_project/service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController usernameCont = TextEditingController(text: 'donero');
  TextEditingController passwordCont = TextEditingController(text: 'ewedon');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Echo Store'),        
        backgroundColor: Color.fromRGBO(227, 118, 43, 5),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: usernameCont,
              decoration: InputDecoration(
                labelText: "mor_2314",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: passwordCont,
              decoration: InputDecoration(
                labelText: "83r5^_",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              //width: MediaQuery.of(context).size.width,
              width: 200,
              child: ElevatedButton(
                onPressed: () async {
                  final getToken = await ApiService()
                      .userLogin(usernameCont.text, passwordCont.text);

                  if (getToken['token'] != null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Logado ^^')));

                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Home();
                      }));
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Nome ou usuario incorretos')));
                  }
                },
               
           
                child: Text(                  
                  "Login",                             
                  style: TextStyle(                    
                    fontSize: 25,
                    fontWeight: FontWeight.bold,  
                    
                                  
                    
                  ),
                ),
                
              ),
            ),
            Container(
                            height: 50,
              //width: MediaQuery.of(context).size.width,
              width: 200,
              child: ElevatedButton(
                onPressed: () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Indo para registro ^^')));
                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Register();
                    }));
                  });
                },
                child: Text(
                  "Registrar",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
