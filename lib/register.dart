import 'login.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'default.dart';
import 'connect.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Register createState() => Register();
}

class Register extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isobscure = true;
  bool ischecked = false;

  // 在类级定义控制器
  final nameController1 = TextEditingController();
  final nameController2 = TextEditingController();
  final nameController3 = TextEditingController();
  final nameController4 = TextEditingController();
  final nameController5 = TextEditingController(); // 选填
  final nameController6 = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 为控制器添加监听器
    nameController1.addListener(_updateButtonState);
    nameController2.addListener(_updateButtonState);
    nameController3.addListener(_updateButtonState);
    nameController4.addListener(_updateButtonState);
    nameController5.addListener(_updateButtonState); // 虽然是选填，但仍可监听
    nameController6.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    nameController1.dispose();
    nameController2.dispose();
    nameController3.dispose();
    nameController4.dispose();
    nameController5.dispose();
    nameController6.dispose();
    super.dispose();
  }

  // 当文本变化时调用 setState
  void _updateButtonState() {
    setState(() {
      // 触发重建以更新按钮状态
    });
  }

  // 检查所有必填字段是否都有输入
  bool _allFieldsFilled() {
    return nameController1.text.isNotEmpty &&
        nameController2.text.isNotEmpty &&
        nameController3.text.isNotEmpty &&
        ischecked;
    // nameController5（姓名）是选填的，不用检查
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: const Text(''),
      toolbarHeight: 10,
      centerTitle: true,
      backgroundColor: Color(0xFF4B9BE1),
    );

    final nameField1 = TextField(
      controller: nameController1,
      decoration: InputDecoration(
        filled: true,  // 设置为true，使背景为填充色
        fillColor: Color(0xFFCFD1D6),  // 设置背景颜色
        hintText: '您的電子信箱',  // 设置提示文字
        hintStyle: TextStyle(
          color: Colors.white,  // 设置提示文字的颜色
          fontSize: 14.0,
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
        filled: true,
        fillColor: Color(0xFFCFD1D6),
        hintText: '密碼(至少8個字符)',
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
      obscureText: isobscure,
    );

    final nameField3 = TextField(
      controller: nameController3,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFCFD1D6),
        hintText: '密碼再次確認',
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(0.0),
        ),
        suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              isobscure = !isobscure;
            });
          },
          icon: Image.asset('assets/Eye.png'),
        ),
      ),
      obscureText: isobscure,
    );

    final nameField4 = TextField(
      controller: nameController4,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFCFD1D6),
        hintText: '您的手機號碼',
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
    );

    final nameField5 = TextField(
      controller: nameController5,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFCFD1D6),
        hintText: '您的姓名',
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
    );

    final nameField6 = TextField(
      controller: nameController6,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFCFD1D6),
        hintText: '您的住址',
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
    );

    final btn1 = ElevatedButton(
      onPressed: _allFieldsFilled()
          ? () async {
        if (nameController2.text != nameController3.text) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('密碼不匹配')),
          );
          return;
        }

        try {
                UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                  email: nameController1.text.trim(),
                  password: nameController2.text.trim(),
                );

                await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
                  'email': nameController1.text.trim(),
                  'phone': nameController4.text.trim(),
                  'name': nameController5.text.trim(),
                  'address': nameController6.text.trim(),
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('註冊成功')),
                );
              } on FirebaseAuthException catch (e) {
                String message;
                if (e.code == 'weak-password') {
                  message = '密碼過於簡單';
                } else if (e.code == 'email-already-in-use') {
                  message = '該帳號已被註冊';
                } else {
                  message = '註冊失敗: 您輸入的不是電子郵件!';
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              }
      }
          : null, // 当条件不满足时禁用按钮
      child: const Text('創建帳號'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Color(0xFFC4C4C5); // 禁用时的颜色
            }
            return Colors.black; // 启用时的颜色
          },
        ),
        foregroundColor: MaterialStateProperty.all(Color(0xFFFFFFFF)),
      ),
    );

    final btn4 = TextButton(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreen())),
      child: const Text('隱私政策'),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Color(0xFF000000)),
      ),
    );

    final googlebtn = ElevatedButton.icon(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DefaultScreen())),
      label: const Text('Google'),
      icon: Image.asset('assets/google.png'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFEAEAEA)),
        foregroundColor: MaterialStateProperty.all(Color(0xFF000000)),
        side: MaterialStateProperty.all(BorderSide(color: Colors.black, width: 1.0)),
      ),
    );

    final fbbtn = ElevatedButton.icon(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ConnectScreen())),
      label: const Text('Facebook'),
      icon: Image.asset('assets/fb.png'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFEAEAEA)),
        foregroundColor: MaterialStateProperty.all(Color(0xFF000000)),
        side: MaterialStateProperty.all(BorderSide(color: Colors.black, width: 1.0)),
      ),
    );

    final backicon = IconButton(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen())),
      icon: Image.asset('assets/back.png'),
      iconSize: 30,
    );

    final topic = const Text(
      '創建Bezalel帳號',
      style: TextStyle(
        fontSize: 24,
      ),
    );

    final hint1 = const Text(
      '您的詳細資訊將有助於我們為您提供更好的服務！(以下選填)',
      style: TextStyle(
        fontSize: 14,
      ),
    );

    final agree = Checkbox(
      value: ischecked,
      onChanged: ( bool? value ){
        setState(() {
          ischecked = value ?? false;
          print('Checkbox is checked: $ischecked');
        });
      },
      activeColor: Color(0xFFEAEAEA),
      checkColor: Color(0xFF000000),
      side: BorderSide(color: Color(0xFF585858), width: 1.0),
    );

    final icon = Image.asset('assets/logo.png');

    final widget = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: backicon,
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 0,top:0),
          ),
          icon,
          topic,
          Container(
            margin: const EdgeInsets.only(bottom: 15,top:15),
            child: ConstrainedBox(
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
            margin: const EdgeInsets.only(bottom: 15),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 300,
                maxWidth: 380,
                minHeight: 50,
                maxHeight: 50,
              ),
              child: nameField2,
            ),
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 35),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 300,
                maxWidth: 380,
                minHeight: 50,
                maxHeight: 50,
              ),
              child: nameField3,
            ),
          ),

          Container(
            child: hint1,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 16,bottom: 15),
          ),

          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: ConstrainedBox(
                  constraints:BoxConstraints(
                    minWidth: 140,
                    maxWidth: 180,
                    minHeight: 50,
                    maxHeight: 50,
                  ),
                  child: nameField4,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 18),
                child: ConstrainedBox(
                  constraints:BoxConstraints(
                    minWidth: 140,
                    maxWidth: 180,
                    minHeight: 50,
                    maxHeight: 50,
                  ),
                  child: nameField5,
                ),
              ),
            ],
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 20,top: 15),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 300,
                maxWidth: 380,
                minHeight: 50,
                maxHeight: 50,
              ),
              child: nameField6,
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                agree,
                Text(
                  '我同意Bezalel',
                  style: TextStyle(color: const Color(0xFF585858),),
                ),
                btn4,
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 20,top:0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 300,
                maxWidth: 380,
                minHeight: 50,
                maxHeight: 50,
              ),
              child: btn1,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child:ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 140,
                    maxWidth: 180,
                    minHeight: 50,
                    maxHeight: 50,
                  ),
                  child: googlebtn,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 140,
                  maxWidth: 180,
                  minHeight: 50,
                  maxHeight: 50,
                ),
                child: fbbtn,
              ),
            ],
          ),
        ],
      ),
    );

    final page = Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: widget,
      ),
      backgroundColor: const Color(0xFFEAEAEA),
    );

    return page;
  }
}
