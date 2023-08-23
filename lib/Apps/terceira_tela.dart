import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class TerceiraTela extends StatefulWidget {
  const TerceiraTela({super.key, required this.title});
  final String title;
  @override
  State<TerceiraTela> createState() => _TerceiraTelaState();
}

class _TerceiraTelaState extends State<TerceiraTela> {
  final _value1 = TextEditingController();
  final _value2 = TextEditingController();

  double result = 0;

  void Sum(){
    setState(() {
      result = (double.tryParse(_value1.text) ?? 0.0) + (double.tryParse(_value2.text) ?? 0.0);
    });
  }

  void Sub(){
    setState(() {
      result = (double.tryParse(_value1.text) ?? 0.0) - (double.tryParse(_value2.text) ?? 0.0);
    });
  }

  void Div(){
    setState(() {
      result = (double.tryParse(_value1.text) ?? 0.0) / (double.tryParse(_value2.text) ?? 0.0);
    });
  }

  void Mult(){
    setState(() {
      result = (double.tryParse(_value1.text) ?? 0.0) * (double.tryParse(_value2.text) ?? 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child:  ListView(
          //teste de comentario
          //padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),

            ListTile(
              title: const Text('Bem-vindo'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: "Seja Bem-Vindo")),
                );
              },
            ),
            ListTile(
              title: const Text('Calculadora'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TerceiraTela(title: "Calcule")),
                );
              },
            ),
            ListTile(
              title: const Text('Formulário'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TerceiraTela(title: "Formulário")),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            //Valor 1
            TextFormField(
              controller: _value1,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: Colors.white60
                      )
                  ),
                  hintText: "First number",
                  icon: Icon(Icons.numbers, color: Colors.lightBlueAccent,)
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10,),
            //Valor 2
            TextFormField(
              controller: _value2,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: Colors.white60
                      )
                  ),
                  hintText: "Second number",
                  icon: Icon(Icons.numbers, color: Colors.lightBlueAccent,)
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  ElevatedButton(onPressed: () {
                    Sum();
                    SizedBox(
                      height: 10,
                      width: 10,
                    );
                  },
                      child: const Text("Sum",
                          style: TextStyle(color: Colors.black,
                              fontSize: 20))),
                  SizedBox(width: 10,),

                  ElevatedButton(onPressed: () {
                    Div();
                  },
                      child: const Text("Divide",
                          style: TextStyle(color: Colors.black,
                              fontSize: 20))),

                ]
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  Sub();
                },
                    child: const Text("Subtract",
                        style: TextStyle(color: Colors.black,
                            fontSize: 20))),
                SizedBox(width: 10,),

                ElevatedButton(onPressed: () {
                  Mult();
                },
                    child: const Text("Multiply",
                        style: TextStyle(color: Colors.black,
                            fontSize: 20))),
                SizedBox(height: 10,),
              ],
            ),
            SizedBox(height: 20,),
            Text("Resultado: $result", style: TextStyle(color: Colors.red, fontSize: 30))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
