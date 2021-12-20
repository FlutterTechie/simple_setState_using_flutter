import 'package:flutter/material.dart';

class Operations extends StatefulWidget
{
  const Operations({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
  return OperationsState();
  }
}
class OperationsState extends State<Operations>
{
  late TextEditingController _number1;
  late TextEditingController _number2;
  late String number3 = "Hello World";

  @override
  void initState() {
    super.initState();
    _number1 = TextEditingController();
    _number2 = TextEditingController();
  }

  @override
  void dispose() {
    _number1.dispose();
    _number2.dispose();
    super.dispose();
  }
  void setAnswer()
  {
    //Updating the value using setState...
    setState(() {
      number3 =(int.parse(_number1.text) + int.parse(_number2.text)).toString();
    });
  }
  void resetValues()
  {
    //Resetting the value using setState
    setState(() {
      _number1.text = "";
      _number2.text = "";
      number3 ="";
    });
  }

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Scaffold(
         appBar: AppBar(
           title: const Text("Arithmetic calculator"),
           centerTitle: true,
         ),
         body: Center(
           child: ListView(
             children: [
               TextField(
                 controller: _number1,
               keyboardType: TextInputType.number,
                 decoration: const InputDecoration(
                   label: Text("Number1")
                 ),
               ),
               TextField(
                 controller: _number2,
                 keyboardType: TextInputType.number,
                 decoration: const InputDecoration(
                     label: Text("Number2")
                 ),
               ),
               const SizedBox(
                 height: 15.0,
               ),
               ElevatedButton(onPressed: () => setAnswer(),
                   child:const Text("Click here")),
               ElevatedButton(onPressed: () => resetValues(),
                   child:const Text("Reset")),
               Text(number3),
             ],
           ),
         ),
       ),
    );
  }
}
