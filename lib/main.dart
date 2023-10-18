import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedNumber = '0';
  bool showNumberPad = true; // Add a flag to show/hide the number pad

  final Map<String, String> numberToImage = {
    '1': 'lib/assets/1.png',
    '2': 'lib/assets/2.png',
    '3': 'lib/assets/3.png',
    '4': 'lib/assets/4.png',
    '5': 'lib/assets/5.png',
    '6': 'lib/assets/6.png',
    '7': 'lib/assets/7.png',
    '8': 'lib/assets/8.png',
    '9': 'lib/assets/9.png',
  };

  void onNumberButtonPressed(String number) {
    setState(() {
      selectedNumber = number;
    });
  }

  void onFloatingButtonPressed() {
    setState(() {
      showNumberPad =
          !showNumberPad; // Toggle the flag to switch between number pad and image display
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onFloatingButtonPressed();
        },
        child: Icon(
          showNumberPad
              ? Icons.image_rounded
              : Icons.keyboard_return_rounded, // Toggle between icons
        ),
      ),
      body: Stack(alignment: Alignment.center, children: <Widget>[
        if (showNumberPad)
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 700.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      selectedNumber,
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.all(10.0), // Adjust the margin size
                          child: NumberButton("1", onNumberButtonPressed),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(10.0), // Adjust the margin size
                          child: NumberButton("2", onNumberButtonPressed),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(10.0), // Adjust the margin size
                          child: NumberButton("3", onNumberButtonPressed),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.all(10.0), // Adjust the margin size
                          child: NumberButton("4", onNumberButtonPressed),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(10.0), // Adjust the margin size
                          child: NumberButton("5", onNumberButtonPressed),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(10.0), // Adjust the margin size
                          child: NumberButton("6", onNumberButtonPressed),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.all(10.0), // Adjust the margin size
                          child: NumberButton("7", onNumberButtonPressed),
                        ),
                        Container(), // Espace vide
                        Padding(
                          padding:
                              EdgeInsets.all(10.0), // Adjust the margin size
                          child: NumberButton("8", onNumberButtonPressed),
                        ),
                        Container(), // Espace vide
                        Padding(
                          padding:
                              EdgeInsets.all(10.0), // Adjust the margin size
                          child: NumberButton("9", onNumberButtonPressed),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(), // Espace vide
                        Padding(
                          padding:
                              EdgeInsets.all(10.0), // Adjust the margin size
                          child: NumberButton("0", onNumberButtonPressed),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        if (!showNumberPad)
          Center(
            child: Center(
              child: Image.network("lib/assets/$selectedNumber.png")
            ),
          ),
      ]),
    );
  }
}

class NumberButton extends StatelessWidget {
  final String number;
  final Function(String) onPressed;

  NumberButton(this.number, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed(number);
      },
      child: Text(
        number,
        style:
            TextStyle(fontSize: 20.0), // Ajustez la taille du texte au besoin
      ),
    );
  }
}
