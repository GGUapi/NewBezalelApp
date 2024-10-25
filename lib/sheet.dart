import 'sync.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'register.dart';
import 'sync.dart';
//import 'category.dart';
import 'newpassword.dart';

class SheetScreen extends StatefulWidget{
  const SheetScreen({Key? key}) : super(key: key);

  @override
  SheetScreenState createState() => SheetScreenState();
}

class SheetScreenState extends State<SheetScreen> {
  bool ischecked = false;
  bool isobscure = true;
  String? selectService;
  String _selectedBrand = '';
  @override
  Widget build(BuildContext context) {
    final nameController1 = TextEditingController();
    final nameController2 = TextEditingController();
    final nameController3 = TextEditingController();

    final nameField1 = TextField(
      controller: nameController1,
      decoration: InputDecoration(
        filled: true,  // 设置为true，使背景为填充色
        fillColor: Color(0xFFCFD1D6),  // 设置背景颜色
        hintText: '手機品牌(eg:Iphone,華為...)',  // 设置提示文字
        hintStyle: TextStyle(
          color: Colors.white,  // 设置提示文字的颜色
          fontSize: 18.0,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // 设置内边距
        border: OutlineInputBorder(
          borderSide: BorderSide.none,  // 移除边框线
          borderRadius: BorderRadius.circular(0.0),  // 设置圆角
        ),
      ),
    );

    final nameField2 = TextField(
      controller: nameController2,
      decoration: InputDecoration(
        filled: true,  // 设置为true，使背景为填充色
        fillColor: Color(0xFFCFD1D6),  // 设置背景颜色
        hintText: '手機型號(SE,XR...)',  // 设置提示文字
        hintStyle: TextStyle(
          color: Colors.white,  // 设置提示文字的颜色
          fontSize: 18.0,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // 设置内边距
        border: OutlineInputBorder(
          borderSide: BorderSide.none,  // 移除边框线
          borderRadius: BorderRadius.circular(0.0),  // 设置圆角
        ),
      ),
    );

    final nameField3 = TextField(
      controller: nameController3,
      decoration: InputDecoration(
        filled: true,  // 设置为true，使背景为填充色
        fillColor: Color(0xFFCFD1D6),  // 设置背景颜色
        hintText: '軟體版本(eg:15.3)',  // 设置提示文字
        hintStyle: TextStyle(
          color: Colors.white,  // 设置提示文字的颜色
          fontSize: 18.0,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // 设置内边距
        border: OutlineInputBorder(
          borderSide: BorderSide.none,  // 移除边框线
          borderRadius: BorderRadius.circular(0.0),  // 设置圆角
        ),
      ),
    );

    final osDropdown = DropdownButton<String>(
      value: selectService,
      hint: Text('選擇您所購買的設備'), // 提示文本
      items: <String>['Prelude XR', 'Prelude X', 'Prelude XS', 'Omnia X'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectService = newValue; // 更新选中的值
        });
      },
      isExpanded: true, // 扩展使其占据整个宽度
      style: TextStyle(fontSize: 18.0, color: Colors.black), // 文本样式
      dropdownColor: Color(0xFFCFD1D6), // 下拉菜单的背景颜色
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    );

    final brandRadioGroup = Column(
      children: <Widget>[
        Container(
          child: Text('您是否使用手機殼?',style: TextStyle(fontSize: 16),),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        ),
        RadioListTile<String>(
          title: const Text('使用MagSafe磁吸手機殼',style: TextStyle(fontSize: 14),),
          value: '使用MagSafe磁吸手機殼',
          groupValue: _selectedBrand,
          onChanged: (String? value) {
            setState(() {
              _selectedBrand = value!;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('使用其他手機殼',style: TextStyle(fontSize: 14),),
          value: '使用其他手機殼',
          groupValue: _selectedBrand,
          onChanged: (String? value) {
            setState(() {
              _selectedBrand = value!;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('不使用手機殼',style: TextStyle(fontSize: 14),),
          value: '不使用手機殼',
          groupValue: _selectedBrand,
          onChanged: (String? value) {
            setState(() {
              _selectedBrand = value!;
            });
          },
        ),
      ],
    );

    final btn = ElevatedButton(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewPasswordScreen())),
      child: const Text('送出'),
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0.0),
        foregroundColor: (Color(0xFFFFFFFF)),
        backgroundColor: (Color(0xFFC4C4C5)),
      ),
    );

    final linebtn = ElevatedButton.icon(
      onPressed: () => _showForgotPasswordDialog(context),
      label: const Text('Line'),
      icon: Image.asset('assets/line.png'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFF000000)),
        foregroundColor: MaterialStateProperty.all(Color(0xFFFFFFFF)),
        side: MaterialStateProperty.all(BorderSide(color: Colors.black, width: 1.0)),
      ),
    );

    final fbbtn = ElevatedButton.icon(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreen())),
      label: const Text('Messenger'),
      icon: Image.asset('assets/messenger.png'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFF000000)),
        foregroundColor: MaterialStateProperty.all(Color(0xFFFFFFFF)),
        side: MaterialStateProperty.all(BorderSide(color: Colors.black, width: 1.0)),
      ),
    );

    final topic = const Text(
      '請填寫以下資訊(選填)',
      style: TextStyle(
        fontSize: 16,
      ),
    );

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
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Image.asset('assets/wback.png'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30.0,bottom: 10.0),
                  child: topic,
                  alignment: Alignment.centerLeft,
                ),

                Container(
                  margin: EdgeInsets.only(top: 0.0),
                  child:ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 300,  // 最小宽度
                      maxWidth: 380,  // 最大宽度
                      minHeight: 50,  // 最小高度
                      maxHeight: 50,  // 最大高度
                    ),
                    child: nameField1,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child:ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 300,  // 最小宽度
                      maxWidth: 380,  // 最大宽度
                      minHeight: 50,  // 最小高度
                      maxHeight: 50,  // 最大高度
                    ),
                    child: nameField2,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child:ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 300,  // 最小宽度
                      maxWidth: 380,  // 最大宽度
                      minHeight: 50,  // 最小高度
                      maxHeight: 50,  // 最大高度
                    ),
                    child: nameField3,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  color: const Color(0xFFCFD1D6),
                  child:ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 300,  // 最小宽度
                      maxWidth: 380,  // 最大宽度
                      minHeight: 50,  // 最小高度
                      maxHeight: 50,  // 最大高度
                    ),
                    child: osDropdown,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 30.0,bottom: 30.0),
                  color: const Color(0xFFCFD1D6),
                  child:brandRadioGroup,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child:ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 160,  // 最小宽度
                          maxWidth: 180,  // 最大宽度
                          minHeight: 50,  // 最小高度
                          maxHeight: 50,  // 最大高度
                        ),
                        child: fbbtn,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 160,  // 最小宽度
                        maxWidth: 180,  // 最大宽度
                        minHeight: 50,  // 最小高度
                        maxHeight: 50,  // 最大高度
                      ),
                      child: linebtn,
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

  void _showSnackBar(BuildContext context, String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blue,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showForgotPasswordDialog(BuildContext context) {
    final emailController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('重設密碼'),
        content: TextField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: '輸入註冊的帳號',
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              String email = emailController.text.trim();
              if (email.isEmpty) {
                //Fluttertoast.showToast(msg: "請輸入帳號");
                return;
              }

              /*try {
                await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                Fluttertoast.showToast(msg: "重設密碼郵件已發送");
                Navigator.of(context).pop();
              } on FirebaseAuthException catch (e) {
                Fluttertoast.showToast(msg: "重設密碼失敗: ${e.message}");
              }*/
            },
            child: const Text('確認'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
        ],
      ),
    );
  }
}


