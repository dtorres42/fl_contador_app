import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int contador = 0;

  void incrementar() {
    contador++;
    setState(() {});
  }

  void decrementar() {
    contador--;
    setState(() {});
  }

  void reset() {
    contador = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const tamano20 = TextStyle(fontSize: 20);

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(title: Text('HomeScreen'), elevation: 10.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Numero de clics', style: tamano20),
            SizedBox(height: 20),
            Text('$contador', style: tamano20),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingCustomButton(
        incrementarFn: incrementar,
        decrementarFn: decrementar,
        resetFn: reset,
      ),
    );
  }
}

class CustomFloatingCustomButton extends StatelessWidget {
  final Function incrementarFn;
  final Function decrementarFn;
  final Function resetFn;

  const CustomFloatingCustomButton({
    super.key,
    required this.incrementarFn,
    required this.decrementarFn,
    required this.resetFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => incrementarFn(),
        ),
        FloatingActionButton(
          child: const Text('Reset'),
          onPressed: () => resetFn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.remove),
          onPressed: () => decrementarFn(),
        ),
      ],
    );
  }
}
