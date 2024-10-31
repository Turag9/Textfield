import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _obscureText = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  var email=TextEditingController();
  var password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Email",
                hintText: "Enter Your Email!",
                prefixIcon: Icon(Icons.email)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: password,
              obscureText: _obscureText,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "PassWord",
                 hintText: "Password",
                prefixIcon: Icon(Icons.password),
                suffixIcon: IconButton(onPressed:_togglePasswordVisibility, icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ))
              ),
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(50,50),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),

              onPressed: (){
                String em=email.text;
                String pass=password.text;
                if(em.contains("@")&&em.contains("."))
                Fluttertoast.showToast(msg: "Email: "+em+" Password: "+pass);
                else Fluttertoast.showToast(msg: "Invalied Email");
          }, child: Text("Submit",style: TextStyle(
            color: Colors.white,
            fontSize: 20,

          ),))
        ],
      ),
    );
  }
}
