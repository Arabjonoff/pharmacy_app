import 'package:flutter/material.dart';
import 'package:pharmacy_app/src/model/http_result.dart';
import 'package:pharmacy_app/src/provider/repository.dart';
import 'package:pharmacy_app/src/ui/auth/accept_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
TextEditingController controller = TextEditingController();
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
          ),
          ElevatedButton(onPressed: ()
          async{
            Repository r = Repository();
            HttpResult res = await r.register(controller.text);
            if(res.result['status'] == 1){
              Navigator.push(context, MaterialPageRoute(builder: (builder){
                return AcceptScreen(number: controller.text,);
              }));
            }

          }, child: Text("Yuborish"))
        ],
      ),
    );
  }
}
