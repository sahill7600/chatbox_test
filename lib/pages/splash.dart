import 'package:chatbox_test/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController mainController;
  late Animation mainAnimation;
  @override
  void initState() {
    super.initState();
    mainController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    mainAnimation =
        ColorTween(begin: Colors.deepPurple[900], end: Colors.grey[100])
            .animate(mainController);
    mainController.forward();
    mainController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainAnimation.value,
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'heroicon',
                  child: Icon(
                    Icons.textsms,
                    size: mainController.value * 100,
                    color:Theme.of(context).colorScheme.secondary,
                    //Colors.deepPurple[900],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Hero(
                  tag: 'HeroTitle',
                  child: Text(
                    'Chat box',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        //Colors.deepPurple[900],
                        fontFamily: 'Poppins',
                        fontSize: 26,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TyperAnimatedTextKit(
                  isRepeatingAnimation: false,
                  speed:Duration(milliseconds: 60),
                  text:["World's most private chatting app".toUpperCase()],
                  textStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.secondary,
                      //Colors.deepPurple
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Hero(
                  tag: 'loginbutton',
                  child:
                  CustomButton(
                    text: 'Login',
                    accentColor: Theme.of(context).colorScheme.secondary,
                    //Colors.deepPurple,
                    mainColor: Colors.white,
                    onpress: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Hero(
                  tag: 'signupbutton',
                  child: CustomButton(
                    text: 'Signup',
                    accentColor: Colors.white,
                    mainColor: Theme.of(context).colorScheme.secondary,
                    //Colors.deepPurple,
                    onpress: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text('Made with ♥ by Insignia Developer')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
