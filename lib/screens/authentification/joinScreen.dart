import 'package:flutter/material.dart';
import 'package:warehouseapp/screens/services/auth.dart';

class JoinScreen extends StatefulWidget {
  @override
  _JoinScreenState createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xff55118BB)),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 125),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                Text(
                  'Create an account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                    style: TextStyle(color: Colors.black87),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 15),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xff55118BB),
                      ),
                      hintText: "Enter your email",
                      hintStyle: TextStyle(color: Colors.black38),
                    ),
                    validator: (value) => value.isEmpty
                        ? 'Please enter a valide email address!'
                        : null,
                    onChanged: (value) {
                      setState(() => email = value);
                    }),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 15),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xff55118B),
                    ),
                    hintText: "Enter your password",
                    hintStyle: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                  obscureText: true,
                  validator: (value) => value.length < 8
                      ? 'Please enter at least 8 characters'
                      : null,
                  onChanged: (value) {
                    setState(() => password = value);
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    child: Text(
                      'Join',
                      style: TextStyle(
                        color: Color(0xffFF7878),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result =
                            await _auth.registration(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Please enter a valid email';
                          });
                        }
                      }
                    }),
                SizedBox(height: 25),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 17),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Already have an Account ?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                        text: " Login",
                        style: TextStyle(
                            color: Color(0xffFF7878),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                  onPressed: () => print('Login that I will change...'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget buildEmail() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         'Email',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       SizedBox(height: 15),
//       Container(
//         alignment: Alignment.centerLeft,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(30),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
//             ]),
//         height: 65,
//         child: TextField(
//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(color: Colors.black87),
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.only(top: 15),
//                 prefixIcon: Icon(
//                   Icons.email,
//                   color: Color(0xff55118BB),
//                 ),
//                 hintText: "Enter your email",
//                 hintStyle: TextStyle(
//                   color: Colors.black38,
//                 ))),
//       ),
//     ],
//   );
// }

// Widget buidPassword() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         'Password',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       SizedBox(height: 15),
//       Container(
//         alignment: Alignment.centerLeft,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(30),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
//             ]),
//         height: 65,
//         child: TextField(
//             obscureText: true,
//             style: TextStyle(color: Colors.black87),
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.only(top: 15),
//                 prefixIcon: Icon(
//                   Icons.lock,
//                   color: Color(0xff55118B),
//                 ),
//                 hintText: "Enter your password",
//                 hintStyle: TextStyle(
//                   color: Colors.black38,
//                 ))),
//       ),
//     ],
//   );
// }

// Widget buildLoginBtn() {
//   return Container(
//     padding: EdgeInsets.symmetric(vertical: 30),
//     width: double.infinity,
//     child: RaisedButton(
//       elevation: 5,
//       onPressed: () => print('Login that I will change...'),
//       padding: EdgeInsets.all(20),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       color: Colors.white,
//       child: Text(
//         'Login',
//         style: TextStyle(
//           color: Color(0xffFF7878),
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ),
//   );
// }

// Widget buildSignUpBtn() {
//   return GestureDetector(
//     onTap: () => print("This is for the sign up that I will change later on"),
//     child: RichText(
//       text: TextSpan(children: [
//         TextSpan(
//             text: "Already have an Account ?",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700)),
//         TextSpan(
//           text: " Login",
//           style: TextStyle(
//               color: Color(0xffFF7878),
//               fontSize: 20,
//               fontWeight: FontWeight.bold),
//         ),
//       ]),
//     ),
//   );
// }

// class _JoinScreenState extends State<JoinScreen> {
//   // final AuthService _auth = AuthService();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.light,
//       child: GestureDetector(
//         child: Stack(children: <Widget>[
//           Container(
//               height: double.infinity,
//               width: double.infinity,
//               decoration: BoxDecoration(color: Color(0xff55118BB)),
//               child: SingleChildScrollView(
//                 physics: AlwaysScrollableScrollPhysics(),
//                 padding: EdgeInsets.symmetric(horizontal: 26, vertical: 125),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       'Create an account',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 36,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 50,
//                     ),
//                     buildEmail(),
//                     SizedBox(height: 21),
//                     buidPassword(),
//                     SizedBox(height: 20),
//                     buildLoginBtn(),
//                     SizedBox(height: 20),
//                     buildSignUpBtn()
//                   ],
//                 ),
//               ))
//         ]),
//       ),
//     ));
//   }
// }
