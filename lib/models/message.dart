import 'package:chat_app/constants.dart';

class Message {

  final String message ;
  final String id ;

  Message( {required this.id,required this.message});
  
  factory Message.fromJson (jsonData){

return Message(message:jsonData[kMessage], id: jsonData[kId]) ;


  }
}