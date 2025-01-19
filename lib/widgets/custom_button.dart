import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onPressed , required this.buttonName ,super.key,
  });
  String buttonName ;
  VoidCallback? onPressed ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          
          backgroundColor:const Color(0xff303030), // Button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100), // Rounded edges
          ),
        ),
        child:  Text(
          buttonName,
          style:const TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// class CustomButton extends StatelessWidget {
//    CustomButton({this.buttonName ,
//     super.key,
//   });
//   String? buttonName ;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//       decoration:const  BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(8))
//       ),
//       height: 60,
//       width: double.infinity,
//        child: Center(child: Text(buttonName!,style: TextStyle(fontSize: 18),)),     
//     );
//   }
// }
