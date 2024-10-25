import 'package:flutter/material.dart';
import 'register.dart';
import 'drawer.dart';
import 'find.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('添加設備'),
      centerTitle: true,
      backgroundColor: const Color(0xFF4B9BE1),
      foregroundColor: const Color(0xFFFFFFFF),
    );

    final topic = const Text(
      '添加您的第一台設備',
      style: TextStyle(
        fontSize: 20,
      ),
    );

    final hint = const Text(
      '這個應用程式可以幫助您:\n\n ．查看您的設備狀態\n ．管理您的設備\n ．獲得售後服務',
      style: TextStyle(
        fontSize: 16,
      ),
    );

    // 点击 FloatingActionButton 时，显示弹出框，然后跳转页面
    final addService = FloatingActionButton(
      onPressed: () => _showInitialDialog(context),
      shape: const CircleBorder(),
      child: Image.asset('assets/plus.png'),
      elevation: 0,
      backgroundColor: const Color(0xFFCFD1D6),
    );

    final widget = Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          Container(
            child: addService,
            width: 120,
            height: 120,
            margin: const EdgeInsets.only(top: 80),
          ),
          Container(
            child: topic,
            margin: const EdgeInsets.only(bottom: 120, top: 15),
          ),
          hint,
        ],
      ),
    );

    final appHomePage = Scaffold(
      backgroundColor: const Color(0xFFEAEAEA),
      appBar: appBar,
      body: widget,
      drawer: ResDrawer(),
    );

    return appHomePage;
  }

  // 显示第一个弹窗
  void _showInitialDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          content: Container(
            width: 380,
            height: 100,
            child: const Text('Bezalel 需要打開您的手機藍牙'),
            alignment: Alignment.center,
          ),

          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 130,
                  height: 30,
                  child:
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('拒絕',style: TextStyle(fontSize: 16,color: Colors.black,),),
                      style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    ),
                ),

                Container(
                  width: 130,
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        _navigateToFindScreenWithDialog(context);
                      },
                      child: const Text('同意',style: TextStyle(fontSize: 16,color: Colors.white,),),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    ),
                ),

                ],
            ),


          ],
        );
      },
    );
  }

  // 跳转到 FindScreen 页面并显示另一个弹窗
  void _navigateToFindScreenWithDialog(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FindScreen(),
      ),
    ).then((_) {
      // 在新页面加载完后显示弹窗
      _showFindScreenDialog(context);
    });
  }

  // 在 FindScreen 页面显示弹窗
  void _showFindScreenDialog(BuildContext context) {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('提示'),
            content: const Text('這是FindScreen上的彈跳視窗'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('關閉'),
              ),
            ],
          );
        },
      );
    });
  }
}
