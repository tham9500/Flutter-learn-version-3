import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Input_page extends StatefulWidget {
  Input_page({Key? key}) : super(key: key);

  @override
  State<Input_page> createState() => _Input_pageState();
}

class _Input_pageState extends State<Input_page> {
  String firstName = "", password = "", conpassword = "";
  bool _ispassword = true;
  bool _isconpass = true;
  final form_key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page input"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: form_key,
          child: Container(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Form_firstname(),
                    Form_password(),
                    Form_conPass(),
                    SizedBox(height: 10),
                    Btn_Submit()
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Widget Form_firstname() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'กรุณากรอกชื่อ',
        labelText: 'ชื่อ *',
      ),
      onChanged: (value) => setState(() {
        firstName = value;
      }),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context, errorText: "กรุณากรอกชื่อ")
      ]),
    );
  }

  Widget Form_password() {
    return TextFormField(
      obscureText: _ispassword,
      decoration: InputDecoration(
          icon: Icon(Icons.vpn_key),
          hintText: 'Password',
          labelText: 'Password *',
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _ispassword = !_ispassword;
                });
              },
              icon:
                  Icon(_ispassword ? Icons.visibility_off : Icons.visibility))),
      onChanged: (value) => setState(() {
        password = value;
      }),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context, errorText: "กรุณากรอกรหัสผ่าน"),
        FormBuilderValidators.minLength(context, 8,
            errorText: "กรุณากรอกอย่างน้อย 8 ตัวอักษร"),
        FormBuilderValidators.match(context, conpassword,
            errorText: "รหัสไม่ถูกต้อง")
      ]),
    );
  }

  Widget Form_conPass() {
    return TextFormField(
      obscureText: _isconpass,
      decoration: InputDecoration(
          icon: Icon(Icons.vpn_key_outlined),
          hintText: 'Comform password',
          labelText: 'Confirm Password *',
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isconpass = !_isconpass;
                });
              },
              icon:
                  Icon(_isconpass ? Icons.visibility_off : Icons.visibility))),
      onChanged: (value) => setState(() {
        conpassword = value;
      }),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context, errorText: "กรุณากรอกรหัสผ่าน"),
        FormBuilderValidators.minLength(context, 8,
            errorText: "กรุณากรอกอย่างน้อย 8 ตัวอักษร"),
        FormBuilderValidators.match(context, conpassword,
            errorText: "รหัสไม่ถูกต้อง")
      ]),
    );
  }

  Widget Btn_Submit() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,

      // color: Colors.amber.shade200,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.orange.shade800),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.0),
            ),
          ),
        ),
        child: Text(
          "ยืนยันลงทะเบียน",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        onPressed: () {
          print("Submit click");
          form_key.currentState!.save();

          if (form_key.currentState!.validate()) {}
        },
      ),
    );
  }
}
