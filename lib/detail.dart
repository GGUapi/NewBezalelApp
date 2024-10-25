import 'package:flutter/material.dart';
import 'faqlist.dart';
import 'servicelist.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  String deviceName = "Prelude X 無線充電器"; // 初始設備名稱

  @override
  Widget build(BuildContext context) {
    int powerrate = 100;
    int minute = 40;
    int powerin = 5;
    int wirelessin = 5;
    int wirein = 0;
    int powerout = 10;
    int wirelessout1 = 5;
    int wirelessout2 = 0;
    int wireout = 5;
    int health = 1;
    int temp = 25;

    final topic = Text(
      deviceName, // 動態顯示設備名稱
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );

    final hint1 = const Text(
      '無線充電器狀況良好!',
      style: TextStyle(
        fontSize: 14,
      ),
    );

    final hint2 = const Text(
      '剩餘',
      style: TextStyle(
        fontSize: 12,
        color: Color(0xFF7F7F7F),
      ),
    );

    final hint3 = const Text(
      '充電速度',
      style: TextStyle(
        fontSize: 14,
      ),
    );

    final hint4 = const Text(
      '輸入',
      style: TextStyle(
        fontSize: 12,
      ),
    );

    final hint5 = const Text(
      '無線',
      style: TextStyle(
        fontSize: 12,
        color: Color(0xFF7F7F7F),
      ),
    );

    final hint6 = const Text(
      'USB-C',
      style: TextStyle(
        fontSize: 12,
        color: Color(0xFF7F7F7F),
      ),
    );

    final hint7 = const Text(
      '輸入',
      style: TextStyle(
        fontSize: 12,
      ),
    );

    final hint8 = const Text(
      '無線1',
      style: TextStyle(
        fontSize: 12,
        color: Color(0xFF7F7F7F),
      ),
    );

    final hint9 = const Text(
      '無線2',
      style: TextStyle(
        fontSize: 12,
        color: Color(0xFF7F7F7F),
      ),
    );

    final hint10 = const Text(
      '健康狀況',
      style: TextStyle(
        fontSize: 12,
      ),
    );

    final hint11 = const Text(
      '溫度',
      style: TextStyle(
        fontSize: 12,
      ),
    );

    final info1 = Text(
      '$powerrate',
      style: const TextStyle(
        fontSize: 32,
        color: Color(0xFFFFFFFF),
      ),
    );

    final info2 = const Text(
      '%',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFFFFFFFF),
      ),
    );

    final info3 = Text(
      '$minute 分鐘',
      style: const TextStyle(
        fontSize: 12,
      ),
    );

    final info4 = Text(
      '$powerin W',
      style: const TextStyle(
        fontSize: 32,
      ),
    );

    final info5 = Text(
      '$wirelessin W',
      style: const TextStyle(
        fontSize: 20,
      ),
    );

    final info6 = Text(
      '$wirein W',
      style: const TextStyle(
        fontSize: 20,
      ),
    );

    final info7 = Text(
      '$powerout W',
      style: const TextStyle(
        fontSize: 32,
      ),
    );

    final info8 = Text(
      '$wirelessout1 W',
      style: const TextStyle(
        fontSize: 20,
      ),
    );

    final info9 = Text(
      '$wirelessout2 W',
      style: const TextStyle(
        fontSize: 20,
      ),
    );

    final info10 = Text(
      '$wireout W',
      style: const TextStyle(
        fontSize: 20,
      ),
    );

    final info11 = Text(
      '$temp',
      style: const TextStyle(
        fontSize: 32,
      ),
    );

    final info12 = const Text(
      '℃',
      style: TextStyle(
        fontSize: 16,
      ),
    );

    final icon = Image.asset('assets/flash.png');
    final state = Image.asset('assets/check.png');
    final product = Image.asset('assets/preludeXR_L.png');

    return Scaffold(
      backgroundColor: const Color(0xFFEAEAEA),
      appBar: AppBar(
        title: const Text('帳號資訊'),
        foregroundColor: const Color(0xFFFFFFFF),
        toolbarHeight: 60,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF4B9BE1),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset('assets/wback.png'),
        ),
        actions: [
          PopupMenuButton<int>(
            onSelected: (int result) {
              // 根據選擇的選項跳轉到不同的頁面
              if (result == 0) {
                // 顯示修改設備名稱的彈跳視窗
                _showRenameDialog(context);
              } else if (result == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FaqlistScreen()),
                );
              } else if (result == 2) {
                // 顯示解除綁定確認彈跳視窗
                _showUnbindDialog(context);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 0,
                child: Text('設備重新命名'),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text('前往FAQ'),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text('解除綁定'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  child: topic,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 20),
                ),
                Container(
                  child: product,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                ),
                Row(
                  children: [state, hint1],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          children: [icon, info1, info2],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                        alignment: Alignment.center,
                        color: const Color(0xFF4B9BE1),
                        width: 170,
                        height: 70,
                      ),
                      Container(
                        width: 170,
                        height: 70,
                        color: const Color(0xFFFFFFFF),
                        child: Column(
                          children: [info3, hint2],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: hint3,
                      alignment: Alignment.topLeft,
                      color: const Color(0xFFFFFFFF),
                      width: 340,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Container(
                                child: hint4,
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(top: 24),
                              ),
                              Container(
                                child: info4,
                                alignment: Alignment.center,
                              ),
                              Container(
                                child: hint5,
                                alignment: Alignment.topLeft,
                              ),
                              Container(
                                child: info5,
                                alignment: Alignment.center,
                              ),
                              Container(
                                child: hint6,
                                alignment: Alignment.topLeft,
                              ),
                              Container(
                                child: info6,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(bottom: 24),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            border: const Border(
                              right: BorderSide(
                                color: Color(0xFFD9D9D9),
                                width: 1.0,
                              ),
                            ),
                          ),
                          width: 170,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Container(
                                child: hint7,
                                alignment: Alignment.topLeft,
                              ),
                              Container(
                                child: info7,
                                alignment: Alignment.center,
                              ),
                              Container(
                                child: hint8,
                                alignment: Alignment.topLeft,
                              ),
                              Container(
                                child: info8,
                                alignment: Alignment.center,
                              ),
                              Container(
                                child: hint9,
                                alignment: Alignment.topLeft,
                              ),
                              Container(
                                child: info9,
                                alignment: Alignment.center,
                              ),
                              Container(
                                child: hint6,
                                alignment: Alignment.topLeft,
                              ),
                              Container(
                                child: info10,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                          ),
                          width: 170,
                        ),
                      ],
                    ),
                    Container(
                      child: const Text('  '),
                      alignment: Alignment.topLeft,
                      color: const Color(0xFFFFFFFF),
                      width: 340,
                      height: 20,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 10,
                      ),
                      width: 150,
                      height: 85,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      color: const Color(0xFFFFFFFF),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            child: hint10,
                            alignment: Alignment.topLeft,
                          ),
                          Container(
                            child: const Text(
                              '正常',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            alignment: Alignment.bottomCenter,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: const Color(0xFFFFFFFF),
                      margin: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 10,
                      ),
                      width: 150,
                      height: 85,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            child: hint11,
                            alignment: Alignment.topLeft,
                          ),
                          Container(
                            child: Row(
                              children: [info11, info12],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ),
      ),
    );
  }

  // 顯示重新命名的對話框
  void _showRenameDialog(BuildContext context) {
    TextEditingController _nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('重新命名設備',textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
          content: TextField(
            controller: _nameController,
            style: TextStyle(fontSize: 16,),
            decoration: const InputDecoration(
              hintText: '輸入新的設備名稱',
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // 關閉彈跳視窗
              },
              child: const Text('取消'),
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color(0xFF000000),
                backgroundColor: const Color(0xFFFFFFFF),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  deviceName = _nameController.text; // 更新設備名稱
                });
                Navigator.of(context).pop(); // 關閉彈跳視窗
                _showSnackBar(context, "設備名稱已更新");
              },
              child: const Text('儲存'),
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color(0xFFFFFFFF),
                backgroundColor: const Color(0xFF000000),
              ),
            ),
          ],
        );
      },
    );
  }

  // 顯示解除綁定確認的對話框
  void _showUnbindDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('解除綁定',textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
          content: const Text('您確定要解除綁定這個設備嗎？',style: TextStyle(fontSize: 16,),),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // 關閉彈跳視窗，不解除綁定
              },
              child: const Text('否'),
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color(0xFF000000),
                backgroundColor: const Color(0xFFFFFFFF),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ServicelistScreen()),
                );// 關閉彈跳視窗
                _showSnackBar(context, "設備已解除綁定");
                // 在這裡添加解除綁定的邏輯
              },
              child: const Text('是'),
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color(0xFFFFFFFF),
                backgroundColor: const Color(0xFF000000),
              ),
            ),
          ],
        );
      },
    );
  }

  // SnackBar 用於顯示提示訊息
  void _showSnackBar(BuildContext context, String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blue,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
