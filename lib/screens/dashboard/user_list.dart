import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_admin/model/depression_test_model.dart';
import 'package:mental_health_admin/screens/user_test_details/user_details.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: messageList(),
    );
  }

  Widget messageList() {      
   return StreamBuilder(
      stream: Firestore.instance
          .collection("users")          
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        }

    return Stack(
    children: <Widget>[
      listWidgets(snapshot,context)
      //  ListView.builder(
      //     padding: EdgeInsets.all(10),
      //     // controller: _listScrollController,
      //     itemCount: snapshot.data.documents.length,
      //     itemBuilder:(context, index) {
            // DepressionTestModel  testData = DepressionTestModel.fromMap(snapshot.data.documents[index].data);
      //       print(testData.questions[0]['answer']);
      //       return listWidgets(snapshot.data.documents);
      //   },
      // ),     
    ],
  );


      },
    );
  }

}

Widget listWidgets(AsyncSnapshot<QuerySnapshot> snapshot,BuildContext context) {
// DepressionTestModel  testData = DepressionTestModel.fromMap(snapshot.data.documents[index].data);
  return DataTable(
    columnSpacing: MediaQuery.of(context).size.width < 1300 ? 160.0 : 300.0,    
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text('Name',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    DataColumn(
                      label: Text('Email',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    DataColumn(
                      label: Text('Phone Number',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    DataColumn(
                      label: Text('Action',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    // DataColumn(
                    //   label: Text('Column 5'),
                    // ),
                    // DataColumn(
                    //   label: Text('Column 6'),
                    // ),
                  ],
                  rows:snapshot.data.documents
                .map(
                  (data) => DataRow(                                                                  
                          cells: [
                            DataCell(
                              //Text(user.firstName),
                              Text(data.data['name'])
                            ),
                            DataCell(
                              Text(data.data['email']),
                            ),
                            DataCell(
                              Text(data.data['phone']),
                            ),
                            DataCell(
                              RaisedButton(                                
                                onPressed: (){
                             
                                  Navigator.push(context, MaterialPageRoute(builder:(context){return UserDetails(id:data.data['email'] ,);}));
                                },
                               color: Colors.deepPurple, 
                                child: Text("View",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),)
                            ),
                          ]),
      ).toList(),
   );
}

