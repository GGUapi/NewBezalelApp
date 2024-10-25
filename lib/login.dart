import 'sync.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register.dart';
import 'default.dart';
import 'discover.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool ischecked = false;
  bool isobscure = true;

  // 在类级定义控制器
  final nameController1 = TextEditingController();
  final nameController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 为控制器添加监听器
    nameController1.addListener(_updateButtonState);
    nameController2.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    nameController1.dispose();
    nameController2.dispose();
    super.dispose();
  }

  // 当文本变化时调用 setState
  void _updateButtonState() {
    setState(() {
      // 触发重建以更新按钮颜色
    });
  }

  @override
  Widget build(BuildContext context) {
    final nameField1 = TextField(
      controller: nameController1,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFCFD1D6),
        hintText: '用戶名稱/電話號碼/電子郵件',
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

    final nameField2 = TextField(
      controller: nameController2,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFCFD1D6),
        hintText: '密碼',
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
          onPressed: () {
            setState(() {
              isobscure = !isobscure;
            });
          },
          icon: Image.asset('assets/Eye.png'),
        ),
      ),
      obscureText: isobscure,
    );

    final btn1 = TextButton(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => RegisterScreen())),
      child: const Text('創建帳號'),
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0.0),
        foregroundColor: (Color(0xFF000000)),
      ),
    );

    final btn2 = TextButton(
      onPressed: () => _showForgotPasswordDialog(context),
      child: const Text('忘記密碼'),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Color(0xFF000000)),
      ),
    );

    final btn3 = ElevatedButton(
      onPressed: (nameController1.text.isNotEmpty &&
          nameController2.text.isNotEmpty &&
          ischecked)
          ? () async {
        String email = nameController1.text.trim();
        String password = nameController2.text.trim();

        if (email.isEmpty || password.isEmpty) {
          Fluttertoast.showToast(msg: "請填寫所有欄位");
          return;
        }

        try {
                UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DefaultScreen()),
                );
                Fluttertoast.showToast(msg: "登入成功");
              } on FirebaseAuthException catch (e) {
                String message;
                if (e.code == 'user-not-found') {
                  message = '用戶不存在';
                } else if (e.code == 'wrong-password') {
                  message = '密碼錯誤';
                } else {
                  message = '登入失敗: ${e.message}';
                }
                Fluttertoast.showToast(msg: message);
              }
      }
          : null, // 当条件不满足时禁用按钮
      child: const Text('登入'),
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

    final googlebtn = ElevatedButton.icon(
      onPressed: () => _showForgotPasswordDialog(context),
      label: const Text('Google'),
      icon: Image.asset('assets/google.png'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFEAEAEA)),
        foregroundColor: MaterialStateProperty.all(Color(0xFF000000)),
        side:
        MaterialStateProperty.all(BorderSide(color: Colors.black, width: 1.0)),
      ),
    );

    final fbbtn = ElevatedButton.icon(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => DiscoverScreen())),
      label: const Text('Facebook'),
      icon: Image.asset('assets/fb.png'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFEAEAEA)),
        foregroundColor: MaterialStateProperty.all(Color(0xFF000000)),
        side:
        MaterialStateProperty.all(BorderSide(color: Colors.black, width: 1.0)),
      ),
    );

    final btn4 = TextButton(
      onPressed: () => _showForgotPasswordDialog(context),
      child: const Text('隱私政策'),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Color(0xFF000000)),
      ),
    );

    final topic = const Text(
      '登入帳號',
      style: TextStyle(
        fontSize: 24,
      ),
    );

    final sync = const Text(
      '已有Bezalel的網站帳號?',
      style: TextStyle(
        fontSize: 16,
        color: const Color(0xFF898989),
      ),
    );

    final reg = const Text(
      '沒有帳號?',
      style: TextStyle(
        fontSize: 16,
        color: const Color(0xFF585858),
      ),
    );

    final hint = const Text(
      '至少8個字符',
      style: TextStyle(
        fontSize: 14,
        color: const Color(0xFF333C3E),
      ),
    );

    final agree = Checkbox(
      value: ischecked,
      onChanged: (bool? value) {
        setState(() {
          ischecked = value ?? false;
        });
      },
      activeColor: Color(0xFFEAEAEA),
      checkColor: Color(0xFF000000),
      side: BorderSide(color: Color(0xFF585858), width: 1.0),
    );

    final icon = Image.asset('assets/logo.png');

    return Scaffold(
      backgroundColor: const Color(0xFFEAEAEA),
      appBar: AppBar(
        title: const Text(''),
        toolbarHeight: 10,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF4B9BE1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon,
                topic,
                Container(
                  margin: const EdgeInsets.only(top: 40, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      sync,
                      SizedBox(
                        height: 20,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SyncMainScreen())),
                          child: Text(
                            '同步帳號',
                            style: TextStyle(color: const Color(0xFF000000)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      reg,
                      SizedBox(
                        height: 20,
                        child: btn1,
                      ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 300,
                    maxWidth: 380,
                    minHeight: 50,
                    maxHeight: 50,
                  ),
                  child: nameField1,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  margin: const EdgeInsets.only(bottom: 40),
                  child: hint,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 300,
                    maxWidth: 380,
                    minHeight: 50,
                    maxHeight: 50,
                  ),
                  child: nameField2,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(bottom: 50, top: 0, right: 30),
                  child: btn2,
                ),
                Row(
                  children: [
                    agree,
                    Text(
                      '我同意Bezalel',
                      style: TextStyle(
                        color: const Color(0xFF585858),
                      ),
                    ),
                    btn4,
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 300,
                      maxWidth: 380,
                      minHeight: 50,
                      maxHeight: 50,
                    ),
                    child: btn3,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: ConstrainedBox(
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

              try {
                await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                Fluttertoast.showToast(msg: "重設密碼郵件已發送");
                Navigator.of(context).pop();
              } on FirebaseAuthException catch (e) {
                Fluttertoast.showToast(msg: "重設密碼失敗: ${e.message}");
              }
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
