import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String userName,passWord;


  String _validatorUser(value){
    if(value.isEmpty){
      return 'userName is require';
    }
    return null;
  }

  String _validatorPwd(value){
    if(value.isEmpty){
      return 'password is require';
    }
    return null;
  }

  void _submitForm(){
    registerFormKey.currentState.save();
    if(!registerFormKey.currentState.validate()){
      print('登录失败');
      return;
    }
    print('登录成功');
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                //icon: Icon(Icons.people),
                labelText: 'username', 
                helperText: ''),
              onSaved: (value){
                userName=value;
              },
              validator: _validatorUser,
            ),
            TextFormField(
              obscureText: true,
              decoration:InputDecoration(
                border: OutlineInputBorder(),
                //icon: Icon(Icons.security),
                labelText: 'password', 
                helperText: ''),
              onSaved: (value){
                passWord=value;
              },
              validator: _validatorPwd,
            ),
            SizedBox(
              height: 32.0,
            ),
            Container(
              width: 300,
              child: RaisedButton(
                  color: Colors.blueAccent,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  elevation: 0.0,
                  onPressed: _submitForm),
            )
          ],
        ),
      ),
    );
  }
}
