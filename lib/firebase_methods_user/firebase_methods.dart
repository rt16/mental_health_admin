

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

Firestore firestore = Firestore();
 FirebaseAuth mAuth = FirebaseAuth.instance;

class FirebaseMethods
{
  StorageReference _storageReference;

 // bool _firebaseauthdone;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  //FirebaseAuth _auth= FirebaseAuth.instance;
     Future<String> getUserToken() async {
       var tok;
    
        await _firebaseMessaging.getToken().then((token) {
        debugPrint(token);
        tok= token;
    });
    return tok;
} 
 

Future<void> adminSignIn() async {
 try {
      var user=await FirebaseAuth.instance.signInAnonymously();
      print(user.user.uid);
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }


 

  Future<String> getUserId(String email) async{
    
    Firestore firestore = Firestore();

    QuerySnapshot result = await firestore.collection("USERS_COLLECTION").where("email", isEqualTo: email).getDocuments();

      final List<DocumentSnapshot> docs = result.documents;

      return docs[0]["userId"];

  }






// Future <List<User>> fetchallUsers(String uid) async{

// List<User> userList = List<User>();
// Firestore firestore = Firestore.instance;

// await firestore.collection(USERS_COLLECTION).where("status", isEqualTo: "online").getDocuments().then((QuerySnapshot querySnapshot){

// for(int i=0; i<querySnapshot.documents.length; i++)
// {
//   debugPrint(querySnapshot.documents[i].documentID);

// if (querySnapshot.documents[i].documentID != uid)
// {
//   debugPrint(querySnapshot.documents[i].documentID);
//   userList.add(User.fromMap(querySnapshot.documents[i].data));
// }
// }
// //return userList;
// });
// return userList;
// }





   



    




 
  
//   Future<void>signOut(BuildContext context) async
//   {
//     final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   SharedPreferences prefs = await SharedPreferences.getInstance();
    
//           var uid = prefs.getString("uid");
//           changeUserStatusOffline(uid).then((value){
//             changeVesselStatus(uid).then((value){                      
//             _firebaseAuth.signOut().then((value) {
//             prefs.clear();
//               Navigator.pushAndRemoveUntil(context,
//               MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
//               ModalRoute.withName('/case'));
//              //Navigator.pushReplacementNamed(context, '/login');
//              });
//           });
//            });   
// }









  // Future<void>addDataToDB(String email,DepressionTestModel model) async{
  //   List s_email = email.split('@');
  //   Firestore firestore = Firestore();   
  //   firestore.collection(USERS_COLLECTION).document(s_email[0]).setData(model.toMap(model));
  // }

  // Future<User>getLocalData( String uid) async{
  //   Firestore firestore = Firestore();
  //   User user;
  //   await firestore.collection(USERS_COLLECTION).where("userId", isEqualTo: uid).getDocuments().then((QuerySnapshot querySnapshot){
  //     //for(int i=0; i<querySnapshot.documents.length; i++)
  //     //{
  //       user= User.fromMap(querySnapshot.documents[0].data);
  //    // }

  //   //firestore.collection("users").document(user.userId).setData(user.toMap(user));
  // });
  // return user;
  // }
  // Future<User>getLocalUser() async{
  //   Firestore firestore = Firestore();
  //    SharedPreferences prefs = await SharedPreferences.getInstance();
  //         var uid = prefs.getString("uid");
  //   User user;
  //   await firestore.collection(USERS_COLLECTION).where("userId", isEqualTo: uid).getDocuments().then((QuerySnapshot querySnapshot){
  //     //for(int i=0; i<querySnapshot.documents.length; i++)
  //     //{
  //       user= User.fromMap(querySnapshot.documents[0].data);
  //    // }

  //   //firestore.collection("users").document(user.userId).setData(user.toMap(user));
  // });
  // debugPrint(user.email);
  // return user;
  // }


  Future<FirebaseUser> getCurrentUser() async
  {
    FirebaseUser currentuser;
    currentuser= await _auth.currentUser();
    return currentuser;
  }



   Future<bool> checkLoginUser() async
  {
    FirebaseUser currentuser;
    currentuser= await _auth.currentUser();
    bool result;
    currentuser!=null? result=true: result=false;
    return result;

  }
}