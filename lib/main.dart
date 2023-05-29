import 'package:deep_link_app/services/remote_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  runApp(MyApp());
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  fetchRemoteConfig();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: ChangeTextSizeWithSeekBar(),
    );
  }
}

class ChangeTextSizeWithSeekBar extends StatefulWidget {
  @override
  _ChangeTextSizeWithSeekBarState createState() =>
      _ChangeTextSizeWithSeekBarState();
}

class _ChangeTextSizeWithSeekBarState extends State<ChangeTextSizeWithSeekBar> {
  double _value = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "My size will change",
                style: TextStyle(fontSize: _value),
              ),
              Slider(
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
                max: 100,
                min: 10,
                value: _value,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Get Long Link')),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Get Short Link')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
