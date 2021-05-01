import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mental_health_admin/firebase_methods_user/firebase_methods.dart';
import 'package:mental_health_admin/widgets/gender.dart';
import 'package:mental_health_admin/widgets/input_field.dart';
import 'package:mental_health_admin/widgets/membership.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard/dashboard.dart';


class Home extends StatelessWidget {
  TextEditingController _passwordController= new TextEditingController();
  TextEditingController _emailController= new TextEditingController();

  FirebaseMethods firebaseMethods=new FirebaseMethods();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: EdgeInsets.only(top: 60.0, bottom: 60.0, left: 120.0, right: 120.0),
        child: Card(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(40.0)),
          elevation: 5.0,
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width /3.3,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.yellow[600],
                  child: Padding(
                    padding: EdgeInsets.only(top: 70.0, right: 50.0, left: 50.0), 
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: <Widget>[
                        
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black87,
                              backgroundImage: NetworkImage(
                                'https://cdn3.vectorstock.com/i/1000x1000/42/42/mental-health-care-logo-design-head-leaf-hand-vector-28434242.jpg',
                              ),
                              radius: 70.0,
                            ),
                          ),


                          SizedBox(height: 60.0,),
                        
                    
                          Container(
                            padding: EdgeInsets.only(
                              top: 5.0, 
                              bottom: 5.0
                            ),
                            child: Text(
                              "MHT",
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),

                          SizedBox(height: 5.0,),


                          Container(
                            padding: EdgeInsets.only(
                              top: 5.0, 
                              bottom: 5.0
                            ),
                            child: Text(
                              "It should only take a couple of minutes to pair with your watch",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),

                          SizedBox(height: 50.0,),


                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black87,
                              child: Text(
                                ">", 
                                style: TextStyle(color: Colors.yellow),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),




                Container(
                  padding: EdgeInsets.only(top: 40.0, right: 170.0, left: 170.0, bottom: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      
                      //InputField Widget from the widgets folder
                      InputField(
                        label: "Email",
                        content: "Email",
                        controller:_emailController
                      ),

                     SizedBox(height:12.0),
                      
                        //InputField Widget from the widgets folder
                      InputField(
                        label: "Password",
                        content: "Password",
                        controller:_passwordController
                      ),
                         SizedBox(height:15.0),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 170.0,),
                          
                          SizedBox(width: 20.0,),

                          FlatButton(
                            color: Colors.green,
                            onPressed: (){
                              _login(context);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),

                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
void _login(context){
 firebaseMethods.adminSignIn().then((value) async {
   if(_emailController.text=="admin" && _passwordController.text=="Oscar@33")
   {
     setData().then((value) {
        Fluttertoast.showToast(
        msg: "Logged In Sucessfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
        );
     });
     //show sucess msg and navigate
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){return Dashboard();}));      
   }
 });
}
Future<void> setData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("loggedin",true);
    



  }
}
