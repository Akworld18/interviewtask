import 'dart:io';
import 'package:vgts_design_task/app/features/dashboard/model/options_model.dart';

List <StudentDetails> studentRecord= [];//this is student record list

//this is used for dart task model
List <OptionsModel>options = [
  OptionsModel(id: 1, option: "Add Student"),
  OptionsModel(id: 2, option: "List Student"),
  OptionsModel(id: 3, option: "Exit"),
];

runStudentTask(){
  print("Select any below option:");
  for (var name in options) {
    print("${name.id}.${name.option}");
  }
  print("Enter Your Option:");
  int? option  = int.parse(stdin.readLineSync().toString());
  switch(option){
    case 1:{
      print("Enter Student Id:");
      String? id  = stdin.readLineSync().toString();
      validateStudentDetailsField(id);
      print("Enter Tamil Mark:");
      String? tamil  = stdin.readLineSync().toString();
      validateStudentDetailsField(tamil);
      print("Enter English Mark:");
      String? english  = stdin.readLineSync().toString();
      validateStudentDetailsField(english);
      print("Enter Maths Mark:");
      String? maths  = stdin.readLineSync().toString();
      validateStudentDetailsField(maths);
      addStudentRecord(StudentDetails(id: id, tamil: double.parse(tamil), english: double.parse(english), maths: double.parse(maths), total: double.parse(tamil) + double.parse(english) + double.parse(maths)));

    }
    break;
    case 2:{
      showStudentRecord();
    }
    break;
    case 3:{
      exit(0);
    }
    default:{

    }
  }
}


//this is validate the user input data

validateStudentDetailsField(String data){
  if(data.contains(RegExp('^[a-zA-Z]+'))){
    print("Kindly note that this input only requires numbers; do not include alphabets or unusual characters.");
    exit(0);
  }
}


//this function is used add student in student record list
addStudentRecord(StudentDetails details){
  List <StudentDetails> isContainsRecord = studentRecord.where((element) => element.id == details.id).toList();
  if(studentRecord.isEmpty){
    studentRecord.add(details);
  }
  else if(isContainsRecord.isNotEmpty){
    int indexOfStudent = studentRecord.indexWhere((element) => element.id==details.id);
    studentRecord[indexOfStudent]=details;
  }
  else{
    studentRecord.add(details);
  }
  runStudentTask();
}

//this function is show student records in console
showStudentRecord(){
  studentRecord.sort((a,b)=>b.total.compareTo(a.total));
  print("  Id      Tamil     Eng     Maths    Total    Rank");
  for (int i=0;i<studentRecord.length;i++) {
    print("  ${studentRecord[i].id}    ${studentRecord[i].tamil}    ${studentRecord[i].english}    ${studentRecord[i].maths}    ${studentRecord[i].total}     ${i+1}");
  }

  runStudentTask();

}


