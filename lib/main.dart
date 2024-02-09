

/*If you decide to run a Dart task, uncomment this line and
comment out the runApp function.*/


// import 'package:vgts_design_task/app/features/dashboard/view/interview_dart_task.dart';
// void main(){
//   runStudentTask();
// }





/*If you've decided to run design and API tasks, comment out the "runStudent"
task and uncomment the "runApp" function.*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vgts_design_task/app/features/dashboard/view/dashboard_screen.dart';

void main() {
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 805),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Chatstasy',
          theme: ThemeData(primarySwatch: Colors.blue),
          //
          home:const DashBoardScreen()),
    );
  }
}




