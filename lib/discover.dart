import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'drawer.dart';

class DiscoverScreen extends StatelessWidget{
  const DiscoverScreen({Key?key}):super(key:key);
  @override
  Widget build(BuildContext context){
    final appBar = AppBar(
      title: const Text('添加設備'),
      centerTitle: true,
      backgroundColor: Color(0xFF4B9BE1),
      foregroundColor: Color(0xFFFFFFFF),
      leading: IconButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        icon: Image.asset('assets/wback.png'),
      ),
    );

    final hint = const Text('已發現的藍牙設備',
      style: TextStyle(
        fontSize: 16,
      ),
    );

    final state = const Text('自動探測附近的藍牙設備...',
      style: TextStyle(
        fontSize: 16,
      ),
    );

    final name1 = const Text('Prelude XR MagSafe 磁吸無線充電器\n',
      style: TextStyle(
        fontSize: 14,
        color: Color(0xFF000000),
      ),
    );

    final name2 = const Text('Prelude X MagSafe 磁吸無線充電器\n',
      style: TextStyle(
        fontSize: 14,
        color: Color(0xFF000000),
      ),
    );

    final div = Divider(
      color: Color(0x80979797),
      thickness: 0.5,
    );

    final img1 = Image.asset('assets/preludeXR.png');
    final img2 = Image.asset('assets/X.png');
    final img3 = Image.asset('assets/bluetooth.png');

    final connect = ElevatedButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterScreen())),
        child: Text('連接',style: TextStyle(color: Color(0xFFFFFFFF),),),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF000000),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        ),
    );

    final service1 = ElevatedButton.icon(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreen())),
      label: Column(
        children: [name1, Container(child: connect,alignment: Alignment.bottomRight,height: 30,),],
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
        children: [name2, Container(child: connect,alignment: Alignment.bottomRight,height: 30,),],
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

    final widget = Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: [img3,hint],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            margin: const EdgeInsets.only(bottom: 30,top:50),
          ),

          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 200,  // 最小宽度
              maxWidth: 300,  // 最大宽度
            ),
            child: div,
          ),

          Container(child: service1,margin: const EdgeInsets.only(top: 30,left: 20,right: 20),),
          Container(child: service2,margin: const EdgeInsets.only(top: 30,left: 20,right: 20),),
          Container(child: state,margin: const EdgeInsets.only(bottom: 25,top:75),),
        ],
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10),
    );

    final appHomePage = Scaffold(
      backgroundColor: const Color(0xFFEAEAEA),
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}