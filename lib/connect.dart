import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'drawer.dart';

class ConnectScreen extends StatelessWidget{
  const ConnectScreen({Key?key}):super(key:key);
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

    final state = const Text('正在連接中...',
      style: TextStyle(
        fontSize: 16,
      ),
    );

    final bluehint = const Text('這個過程會持續一段時間，請勿退出!',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF2D69AB),
      ),
      textAlign: TextAlign.center,
    );

    final img1 = Image.asset('assets/bluecell.png');
    final img2 = Image.asset('assets/preludeXR_L.png');

    final icon1 = Icon(
      Icons.circle,
      color: Color(0xFF4A9BE0),
      size: 12.0,  // 圆点的大小
    );

    final icon2 = Icon(
      Icons.circle,
      color: Color(0xFF6EAEE7),
      size: 12.0,  // 圆点的大小
    );

    final icon3 = Icon(
      Icons.circle,
      color: Color(0xFF92C3EC),
      size: 12.0,  // 圆点的大小
    );

    final icon4 = Icon(
      Icons.circle,
      color: Color(0xFFADD2F0),
      size: 12.0,  // 圆点的大小
    );

    final widget = Container(
      child: Column(
        children: <Widget>[
          Container(child: hint,margin: const EdgeInsets.only(bottom: 80,top:50),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: img1),
              Container(child: icon1,margin: EdgeInsets.only(right: 20),),
              Container(child: icon2,margin: EdgeInsets.only(right: 20),),
              Container(child: icon3,margin: EdgeInsets.only(right: 20),),
              Container(child: icon4,margin: EdgeInsets.only(right: 20),),
              Container(child: img2),],
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