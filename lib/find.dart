import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'drawer.dart';

class FindScreen extends StatelessWidget{
  const FindScreen({Key?key}):super(key:key);
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

    final hint = const Text('．請將您的手機盡量靠近需要連接的設備\n．請打開您的手機藍牙',
      style: TextStyle(
        fontSize: 16,
      ),
    );

    final state = const Text('自動探測附近的藍牙設備...',
      style: TextStyle(
        fontSize: 16,
      ),
    );

    final bluehint = const Text('未發現附近可添加設備，\n請檢查是否設備已開啟連線功能',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF2D69AB),
      ),
      textAlign: TextAlign.center,
    );

    final img1 = Image.asset('assets/S.png');
    final img2 = Image.asset('assets/M.png');
    final img3 = Image.asset('assets/L.png');
    final img4 = Image.asset('assets/wbluetooth.png');

    final widget = Container(
      child: Column(
        children: <Widget>[
          Container(child: hint,margin: const EdgeInsets.only(bottom: 80,top:50),),
          Stack(
            children: [img3,img2,img1,img4],
            alignment: Alignment.center,
          ),
          Container(child: state,margin: const EdgeInsets.only(bottom: 25,top:75),),
          Container(child: bluehint,),
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