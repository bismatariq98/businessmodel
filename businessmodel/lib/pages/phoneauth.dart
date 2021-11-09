import 'package:businessmodel/pages/otp.dart';
import 'package:businessmodel/routing/route.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class phone extends StatefulWidget {
  @override
  _phoneState createState() => _phoneState();
}

class _phoneState extends State<phone> {
  String dialCodeDigits = "+92";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff03254c),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(150),
                        bottomRight: Radius.circular(150))),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Phone Auth",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 400,
                height: 60,
                child: CountryCodePicker(
                  onChanged: (country) {
                    setState(() {
                      dialCodeDigits = country.dialCode!;
                    });
                  },
                  initialSelection: "+92",
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  favorite: ["+1", "US", "+92", "PAK"],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10.0, right: 10, top: 20),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Color(0xff003d80),
                            borderRadius: BorderRadius.circular(05)),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter Phone Number",
                            prefix: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(dialCodeDigits),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                          controller: _controller,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 28.0, left: 28.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => otp(
                                    phone: _controller.text,
                                    codeDigits: dialCodeDigits,
                                  )));
                        },
                        child: Container(
                          color: Colors.white,
                          width: double.infinity,
                          height: 40.0,
                          child: Center(
                            child: Text(
                              "Send OTP",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
