import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  InfoScreenState createState() => InfoScreenState();
}

class InfoScreenState extends State<InfoScreen> {
  bool isobscure = true;
  bool _isButtonEnabled = false; // 用於控制按鈕是否啟用
  User? user; // 用於存儲當前 Firebase 用戶
  String name = ''; // 用於顯示姓名
  String phone = ''; // 用於顯示手機號碼
  String email = ''; // 用於顯示電子郵件
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserInfo(); // 初始化時加載用戶信息
  }

  // 從 Firebase Authentication 和 Firestore 獲取當前用戶的信息
  Future<void> _getUserInfo() async {
    user = FirebaseAuth.instance.currentUser; // 獲取當前登錄的用戶
    if (user != null) {
      setState(() {
        email = user!.email ?? ''; // 獲取電子郵件
      });
      // 從 Firestore 獲取額外的用戶信息
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
      if (userDoc.exists) {
        setState(() {
          name = userDoc['name'] ?? ''; // 獲取姓名
          phone = userDoc['phone'] ?? ''; // 獲取手機號碼
        });
      }
    }
  }

  // 顯示密碼修改成功的通知
  void _showSuccessNotification(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('密碼修改成功'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    // 用戶信息顯示
    final hint1 = Text('姓名', style: TextStyle(fontSize: 14, backgroundColor: Color(0xFFCFD1D6),),textAlign: TextAlign.left,);
    final info1 = Text(name, style: TextStyle(fontSize: 20, backgroundColor: Color(0xFFCFD1D6)));

    final hint2 = Text('手機號碼', style: TextStyle(fontSize: 14, backgroundColor: Color(0xFFCFD1D6)),textAlign: TextAlign.left,);
    final info2 = Text(phone, style: TextStyle(fontSize: 20, backgroundColor: Color(0xFFCFD1D6)));

    final hint3 = Text('電子郵件', style: TextStyle(fontSize: 14, backgroundColor: Color(0xFFCFD1D6)),textAlign: TextAlign.left,);
    final info3 = Text(email, style: TextStyle(fontSize: 20, backgroundColor: Color(0xFFCFD1D6)));

    final nameField1 = TextField(
      controller: _passwordController,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        label: const Align(alignment: Alignment.bottomLeft, child: Text('密碼(可點擊修改)')),
        filled: true,
        fillColor: const Color(0xFFCFD1D6),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
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

    final nameField2 = TextField(
      controller: _confirmPasswordController,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        label: const Align(alignment: Alignment.bottomLeft, child: Text('密碼再次確認')),
        filled: true,
        fillColor: const Color(0xFFCFD1D6),
        contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
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

    final btn = ElevatedButton(
      onPressed: () => _showForgotPasswordDialog(context),
      child: const Text('修改密碼'),
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Color(0xFFFFFFFF)),
        backgroundColor: WidgetStateProperty.all(Color(0xFF000000)),
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
          onPressed: () {
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
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      Text(name),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  margin: const EdgeInsets.only(bottom: 30.0, top: 30.0),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFCFD1D6),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: [
                      hint1,
                      info1,
                      hint2,
                      info2,
                      hint3,
                      info3,
                    ],
                  ),
                ),
                /*ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 300,
                    maxWidth: 380,
                    minHeight: 60,
                    maxHeight: 60,
                  ),
                  child: nameField1,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 300,
                    maxWidth: 380,
                    minHeight: 60,
                    maxHeight: 60,
                  ),
                  child: nameField2,
                ),*/
                Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 300,
                      maxWidth: 380,
                      minHeight: 50,
                      maxHeight: 50,
                    ),
                    child: btn,
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
