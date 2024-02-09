//user selected options model
class OptionsModel{
  final int id;
  final String option;

  OptionsModel({required this.id, required this.option});
}


//student record details model

class StudentDetails{
  final String id;
  final double tamil;
  final double english;
  final double maths;
  final double total;

  StudentDetails(
      {required this.id, required this.tamil, required this.english,required this.maths, required this.total});


}