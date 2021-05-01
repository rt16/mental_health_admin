import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_admin/model/depression_test_model.dart';

class UserDetails extends StatefulWidget {
  final String id;

  const UserDetails({Key key, this.id}) : super(key: key);
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:questionList(),
    );
  }
  Widget questionList() { 

   return StreamBuilder(
      stream: Firestore.instance
          .collection("users")
          .where('email' ,isEqualTo: widget.id)            
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        // Question  testData = Question.fromMap(snapshot.data.documents[0].data['questions']);
        if (snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        }

        return Stack(
    children: <Widget>[
       Column(
         children: [
           ListView.builder(
             shrinkWrap: true,
              padding: EdgeInsets.all(10),
              // reverse: true,
              // controller: _listScrollController,
              itemCount: snapshot.data.documents[0].data['questions'].length,
              itemBuilder: (context, index) {

                return _questionAnswerWidget(snapshot.data.documents[0].data['questions'][index]);
              },
            ),
            
         ],
       ),
     
      
    ],
  );


      },
    );
  }
  Widget _questionAnswerWidget(data) {
     return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: makeListTile(data),
      ),
    );
   }
    Widget makeListTile(data){return  ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),        
        title: Text(
         "Q) "+ data['Question'],
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:12.0),
            Text("A) "+data['answer'], style: TextStyle(color: Colors.blueGrey))
          ],
        ),
        );
}
}