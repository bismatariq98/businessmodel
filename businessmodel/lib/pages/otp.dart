import 'package:businessmodel/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class otp extends StatefulWidget {
  final String phone;
  final String codeDigits;
  otp({required this.phone, required this.codeDigits});
  @override
  _otpState createState() => _otpState();
}

class _otpState extends State<otp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinOtpCodecontroller = TextEditingController();
  final FocusNode _pinOtpCodeFocus = FocusNode();
  String? verificationCode;
  final BoxDecoration pinOtpDecoration = BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey));

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${widget.codeDigits + widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) {
            if (value.user != null) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => home()));
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.message.toString()),
            duration: Duration(seconds: 3),
          ));
        },
        codeSent: (String vID, int? resentToken) {
          setState(() {
            verificationCode = vID;
          });
        },
        codeAutoRetrievalTimeout: (String vID) {
          setState(() {
            verificationCode = vID;
          });
        },
        timeout: Duration(seconds: 60));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff03254c),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    verifyPhoneNumber();
                  },
                  child: Text(
                    "Verifying : ${widget.codeDigits}-${widget.phone}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: PinPut(
                fieldsCount: 6,
                textStyle: TextStyle(fontSize: 25, color: Colors.white),
                eachFieldWidth: 40,
                eachFieldHeight: 55,
                focusNode: _pinOtpCodeFocus,
                controller: _pinOtpCodecontroller,
                submittedFieldDecoration: pinOtpDecoration,
                selectedFieldDecoration: pinOtpDecoration,
                followingFieldDecoration: pinOtpDecoration,
                pinAnimationType: PinAnimationType.rotation,
                onSubmit: (pin) async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                            verificationId: verificationCode!, smsCode: pin))
                        .then((value) => {
                              if (value.user != null)
                                {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (c) => home()))
                                }
                            });
                  } catch (e) {
                    FocusScope.of(context).unfocus();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Invalid OTP"),
                      duration: Duration(seconds: 3),
                    ));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
