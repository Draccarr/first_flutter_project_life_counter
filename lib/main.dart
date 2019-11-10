import 'package:audioplayers/audio_cache.dart';
import 'package:first_flutter_project/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'fancy_button.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'First Flutter Demo',
      // theme: ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   primarySwatch: Colors.orange,
      // ),
      debugShowCheckedModeBanner: false,
      theme: defaultTheme(),
      home: MyHomePage(title: 'Life Counter'),
    );
  } //end build method
} //end MyApp class

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
} //MyHomePage class

class _MyHomePageState extends State<MyHomePage> {
  int _total = 40;

  void incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _total without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _total++;
    });
  } //end

  void decrementCounter() {
    setState(() {
      _total--;
    });
  } //end decrementCounter

  resetCounter() {
    // AudioPlayer(mode: PlayerMode.LOW_LATENCY);
    AudioCache player = new AudioCache();
    const alarmAudioPath = 'sounds/buttonSoundTwo.wav';
    player.play(alarmAudioPath);
    setState(() {
      _total = 40;
    });
  } //end resetCounter

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        backgroundColor: defaultTheme().backgroundColor,
        // backgroundColor: Colors.black,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Builder(builder: (context) {
          return Center(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/skyBackground.png'),
                          fit: BoxFit.fitWidth)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topCenter,
                            child: FancyButton(
                              onPressed: () {
                                resetCounter();
                                Scaffold.of(context).removeCurrentSnackBar();
                                SnackBar snackBar = SnackBar(
                                  duration: Duration(milliseconds: 500),
                                  shape: StadiumBorder(),
                                  content: Row(
                                    children: <Widget>[
                                      Image.asset('assets/images/logo.png',
                                          width: 100, height: 100),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Your life total has been reset."),
                                    ],
                                  ),
                                  // content:
                                  //     Image.asset('assets/images/background.png',),
                                );
                                Scaffold.of(context).showSnackBar(snackBar);
                              },
                              myIconData: Icons.restore,
                              message: "Reset",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Text(
                          _total.toString(),
                          style: _total <= 0
                              ? Theme.of(context).textTheme.display2
                              : Theme.of(context).textTheme.display1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: FancyButton(
                                onPressed: decrementCounter,
                                myIconData: Icons.arrow_downward,
                                message: "Decrease",
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: FancyButton(
                                onPressed: incrementCounter,
                                myIconData: Icons.arrow_upward,
                                message: "Increase",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }));
  } //end Widget Build
} //end _MyHomePageState
