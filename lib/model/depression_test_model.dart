// To parse this JSON data, do
//
//     final depressionTestModel = depressionTestModelFromJson(jsonString);

import 'dart:convert';

DepressionTestModel depressionTestModelFromJson(String str) => DepressionTestModel.fromJson(json.decode(str));

String depressionTestModelToJson(DepressionTestModel data) => json.encode(data.toJson());

class DepressionTestModel {
    DepressionTestModel({
        this.name,
        this.email,
        this.phone,
        this.questions,
    });

    String name;
    String email;
    String phone;
    List<dynamic> questions;

    factory DepressionTestModel.fromJson(Map<String, dynamic> json) => DepressionTestModel(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        questions: json["questions"] == null ? null : List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "questions": questions == null ? null : List<Question>.from(questions.map((x) => x.toJson())),
    };

Map toMap( DepressionTestModel depressionTestModel){
var data =Map<String, dynamic>();
data['name'] = depressionTestModel.name;
data['email']= depressionTestModel.email;
data['phone']=depressionTestModel.phone;
data['questions']=new List<Question>.from(depressionTestModel.questions.map((x) => x.toJson()));


return data;

}
  DepressionTestModel.fromMap(Map<String, dynamic> map) {
   // Message _message = Message();
    this.name = map['name'];
    this.email = map['email'];
    this.phone=map['phone'];
    this.questions=map['questions'].toList(); 
  }
}

class Question {
    Question({
        this.question,
        this.answer,
    });

    String question;
    String answer;
    Question.fromMap(Map<String, dynamic> map) {
   // Message _message = Message();
    this.question = map['question'];
    this.answer = map['answer'];
  
  }
    factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json["Question"] == null ? null : json["Question"],
        answer: json["answer"] == null ? null : json["answer"],
    );

    Map<String, dynamic> toJson() => {
        "Question": question == null ? null : question,
        "answer": answer == null ? null : answer,
    };
}
