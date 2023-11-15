import 'package:flutter/material.dart';
import 'package:pharmacy_app/src/provider/repository.dart';

class AcceptScreen extends StatefulWidget {
  final String number;
  const AcceptScreen({super.key, required this.number});

  @override
  State<AcceptScreen> createState() => _AcceptScreenState();
}
class _AcceptScreenState extends State<AcceptScreen> {
  TextEditingController controllerAccept = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.number,style: TextStyle(fontSize: 30),),
          TextField(
            controller: controllerAccept,
          ),
          ElevatedButton(onPressed: (){
            Repository r = Repository();
            r.accept(widget.number, controllerAccept.text);
          }, child: Text("TASDIQLASH"))
        ],
      ),
    );
  }
}
