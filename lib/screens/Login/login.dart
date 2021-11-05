import 'package:flutter/material.dart';
import 'package:mobile/service/login_service.dart';
import 'package:mobile/screens/dashboard/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _username;
  late TextEditingController _password;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalLoginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  margin:
                      const EdgeInsets.symmetric(vertical: 80, horizontal: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            offset: const Offset(0, 10),
                            blurRadius: 20)
                      ]),
                  child: Form(
                      key: globalLoginFormKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 25),
                          const Text(
                            "Login",
                            // style: Theme.of(context).textTheme.headline2,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _username,
                            // onSaved: ,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter username';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "Username",
                                prefixIcon: Icon(Icons.person)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _password,
                            // onSaved: ,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DashboardScreen()));
                                // if (globalLoginFormKey.currentState!
                                //     .validate()) {
                                //   bool isAuthenticated =
                                //       await LoginService.login(
                                //           _username.text, _password.text);
                                //   if (isAuthenticated == true) {
                                //     ScaffoldMessenger.of(context)
                                //         .showSnackBar(const SnackBar(
                                //       content: Text('Authenticated'),
                                //       duration: Duration(seconds: 1),
                                //     ));
                                //     Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 const DashboardScreen()));
                                //   } else {
                                //     ScaffoldMessenger.of(context)
                                //         .showSnackBar(const SnackBar(
                                //       content:
                                //           Text('Incorrect Username/Password'),
                                //       duration: Duration(seconds: 1),
                                //     ));
                                //   }
                                // }
                              },
                              child: const Text("Login",
                                  style: TextStyle(color: Colors.white)))
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
