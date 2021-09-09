import 'package:flutter/material.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginAuthCubit(),
      child: BlocConsumer<LoginAuthCubit, LoginAuthStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = LoginAuthCubit.get(context);
            return MaterialApp(
              theme: ThemeData(appBarTheme: AppBarTheme(centerTitle: true, elevation: 0, backgroundColor: Colors.white)),
              debugShowCheckedModeBanner: false,
              home: Home(),
            );
          }),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserCredential userCredential;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => LoginAuthCubit(),
      child: BlocConsumer<LoginAuthCubit, LoginAuthStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = LoginAuthCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "LoginNow",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("LoginNow.......!", style: Theme.of(context).textTheme.headline3),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: cubit.isPassword,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffix: IconButton(icon: Icon(cubit.suffix)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    SizedBox(height: 50),
                    Container(
                      child: MaterialButton(
                        onPressed: () async {
                          userCredential = await FirebaseAuth.instance.signInAnonymously();
                        },
                        child: Text(
                          "Login".toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
