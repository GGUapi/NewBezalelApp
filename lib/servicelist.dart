import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'drawer.dart';
import 'detail.dart';

class ServicelistScreen extends StatelessWidget{
  const ServicelistScreen({Key?key}):super(key:key);
  @override
  Widget build(BuildContext context){
    final appBar = AppBar(
      title: const Text("三重劉德華's 設備"),
      centerTitle: true,
      backgroundColor: Color(0xFF4B9BE1),
      foregroundColor: Color(0xFFFFFFFF),
    );

    final topic1 = const Text('Prelude XR MagSafe\n無線充電器',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF000000),
      ),
    );

    final topic2 = const Text('Prelude X MagSafe\n無線充電器',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF000000),
      ),
    );

    final topic3 = const Text('Omnia X MagSafe\n車用充電器',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF000000),
      ),
    );

    final state1 = const Text('● ',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF13A121),
      ),
    );

    final state2 = const Text('● ',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFFA33232),
      ),
    );

    final state3 = const Text('● ',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFFD9D9D9),
      ),
    );

    final hint1 = const Text('正常使用',
      style: TextStyle(
        fontSize: 14,
        color: Color(0xFF737373),
      ),
    );

    final hint2 = const Text('連接錯誤',
      style: TextStyle(
        fontSize: 14,
        color: Color(0xFF737373),
      ),
    );

    final hint3 = const Text('離線',
      style: TextStyle(
        fontSize: 14,
        color: Color(0xFF737373),
      ),
    );

    final service1 = ElevatedButton.icon(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen())),
        label: Column(
            children: [
              topic1,
              Container(
                margin: const EdgeInsets.only(left: 60),
                child: Row(children: [state1,hint1]),
              ),
            ],
          ),

        icon: SizedBox(
          child: Image.asset('assets/preludeXR.png'),
          width: 50.0,
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        ),
    );

    final service2 = ElevatedButton.icon(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreen())),
      label: Column(
        children: [
          topic2,
          Container(
            margin: const EdgeInsets.only(left: 60),
            child: Row(children: [state2,hint2]),
          ),
        ],
      ),

      icon: SizedBox(
        child: Image.asset('assets/X.png'),
        width: 50.0,
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      ),
    );

    final service3 = ElevatedButton.icon(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreen())),
      label: Column(
        children: [
          topic3,
          Container(
            margin: const EdgeInsets.only(left: 60),
            child: Row(children: [state3,hint3]),
          ),
        ],
      ),

      icon: SizedBox(
        child: Image.asset('assets/85W.png'),
        width: 50.0,
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      ),
    );

    final widget = Container(
      child: Column(
        children: <Widget>[
          Container(child: service1,margin: const EdgeInsets.only(top: 30,left: 20,right: 20),),
          Container(child: service2,margin: const EdgeInsets.only(top: 30,left: 20,right: 20),),
          Container(child: service3,margin: const EdgeInsets.only(top: 30,left: 20,right: 20),),
        ],
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10),
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
      drawer: ResDrawer(),
      backgroundColor: const Color(0xFFEAEAEA),
    );

    return appHomePage;
  }
}