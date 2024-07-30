import 'package:calculator/widget/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My Calculator'),
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
  String display = '0';
  num firstOperand = 0;
  num secondOperand = 0;
  String operator = '';
  bool shouldResetDisplay = false;

  void updateDisplay(String newText) {
    setState(() {
      if (shouldResetDisplay || display == '0') {
        display = newText;
        shouldResetDisplay = false;
      } else {
        display += newText;
      }
    });
  }

  void handleOperator(String op) {
    if (operator.isNotEmpty) {
      calculateResult();
    }

    setState(() {
      firstOperand = num.parse(display);
      operator = op;
      shouldResetDisplay = true;
    });
  }

  void calculateResult() {
    if (operator.isEmpty) return;

    secondOperand = num.parse(display);

    setState(() {
      switch (operator) {
        case '+':
          display = (firstOperand + secondOperand).toString();
          break;
        case '-':
          display = (firstOperand - secondOperand).toString();
          break;
        case 'X':
          display = (firstOperand * secondOperand).toString();
          break;
        case '%':
          display = (firstOperand / secondOperand).toString();
          break;
      }
      operator = '';
      firstOperand = 0;
      secondOperand = 0;
      shouldResetDisplay = true;
    });
  }

  void clear() {
    setState(() {
      display = '0';
      firstOperand = 0;
      secondOperand = 0;
      operator = '';
      shouldResetDisplay = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body:Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  display,
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(child: Table(
                  children: [
                    TableRow(
                        children: [
                          CustomButton(text: '1', activity: (){updateDisplay('1');}),
                          CustomButton(text: '2', activity: (){updateDisplay('2');}),
                          CustomButton(text: '3', activity: (){updateDisplay('3');}),
                          CustomButton(text: '+', activity: (){handleOperator('+');}),
                        ]
                    ),
                    TableRow(
                        children: [
                          CustomButton(text: '4', activity: (){updateDisplay('4');}),
                          CustomButton(text: '5', activity: (){updateDisplay('5');}),
                          CustomButton(text: '6', activity: (){updateDisplay('6');}),
                          CustomButton(text: '-', activity: (){handleOperator('-');}),
                        ]
                    ),
                    TableRow(
                        children: [
                          CustomButton(text: '7', activity: (){updateDisplay('7');}),
                          CustomButton(text: '8', activity: (){updateDisplay('8');}),
                          CustomButton(text: '9', activity: (){updateDisplay('9');}),
                          CustomButton(text: 'X', activity: (){handleOperator('X');}),
                        ]
                    ),
                    TableRow(
                        children: [
                          CustomButton(text: '0', activity: (){updateDisplay('0');}),
                          CustomButton(text: '=', activity: (){calculateResult();}),
                          CustomButton(text: 'C', activity: (){clear();}),
                          CustomButton(text: '%', activity: (){handleOperator('%');}),
                        ]
                    ),
                  ]
              ),
              ),
            ]
        )
    );
  }
}
