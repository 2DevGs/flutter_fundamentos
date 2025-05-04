import 'package:flutter/material.dart';
import 'package:flutter_fundamentos/home_page.dart';

class HomePageStatefull extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageStateFullState();
  }

}

class _HomePageStateFullState extends State<HomePageStatefull> {
  String texto = 'Estou no StatefulWidget';

  _HomePageStateFullState() {
    print('_HomePageStateFullState Constructor');
  }

  @override
  void initState() {
    super.initState();
    texto = 'Texto alterado pelo initState';
    print('Inicio do initState');
    
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      print('addPostFrameCallBack');
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomePageStateless(),
      ));
    });
    print('Fim do initState');
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(texto),
            TextButton(
              onPressed: () {
                setState(() {
                  texto = 'Alterei o texto do StatefulWidget';
                });
              }, 
              child: Text('Alterar texto'),
            ),
          ],
        ),
      ),
    );
  }
}
