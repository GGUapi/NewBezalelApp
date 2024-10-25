import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'register.dart';
import 'drawer.dart';
import 'function/changeNotifier.dart';
import 'valid.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  NewPasswordScreenState createState() => NewPasswordScreenState();
}

class NewPasswordScreenState extends State<NewPasswordScreen> {
  bool isobscure = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // 監聽兩個 TextField 的變化
    _passwordController.addListener(_validateInputs);
    _confirmPasswordController.addListener(_validateInputs);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // 檢查兩個 TextField 是否都已輸入
  void _validateInputs() {
    setState(() {
      _isButtonEnabled = _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('設置新密碼'),
      centerTitle: true,
      backgroundColor: const Color(0xFF4B9BE1),
      foregroundColor: const Color(0xFFFFFFFF),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Image.asset('assets/wback.png'),
      ),
    );

    final topic = const Text(
      '請輸入您的新密碼',
      style: TextStyle(
        fontSize: 16,
      ),
    );

    final hint = const Text(
      '至少8個字符',
      style: TextStyle(
        fontSize: 14,
        color: Color(0xFF333C3E),
      ),
    );

    final passwordField = TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        filled: true, // 背景為填充色
        fillColor: const Color(0xFFCFD1D6), // 背景顏色
        hintText: '密碼', // 提示文字
        hintStyle: const TextStyle(
          color: Colors.white, // 提示文字顏色
          fontSize: 14.0,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // 內邊距
        border: OutlineInputBorder(
          borderSide: BorderSide.none, // 移除邊框線
          borderRadius: BorderRadius.circular(0.0), // 圓角
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

    final confirmPasswordField = TextField(
      controller: _confirmPasswordController,
      decoration: InputDecoration(
        filled: true, // 背景為填充色
        fillColor: const Color(0xFFCFD1D6), // 背景顏色
        hintText: '密碼再次確認', // 提示文字
        hintStyle: const TextStyle(
          color: Colors.white, // 提示文字顏色
          fontSize: 14.0,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // 內邊距
        border: OutlineInputBorder(
          borderSide: BorderSide.none, // 移除邊框線
          borderRadius: BorderRadius.circular(0.0), // 圓角
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

    final continueButton = ElevatedButton(
      onPressed: _isButtonEnabled
          ? () {
        // 使用 Provider 保存 Email
        Provider.of<EmailProvider>(context, listen: false)
            .setEmail(_passwordController.text);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ValidMainScreen()),
        );
      }
          : null, // 如果未輸入密碼，則按鈕無效
      child: const Text('繼續'),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        foregroundColor: const Color(0xFFFFFFFF),
        backgroundColor: _isButtonEnabled
            ? const Color(0xFF000000) // 當輸入後按鈕背景變黑色
            : const Color(0xFFC4C4C5), // 當未輸入時按鈕背景變灰色
      ),
    );

    final widget = Container(
      child: Column(
        children: <Widget>[
          Container(
            child: topic,
            margin: const EdgeInsets.only(bottom: 50, left: 20, top: 130),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 300, // 最小寬度
                maxWidth: 380, // 最大寬度
                minHeight: 50, // 最小高度
                maxHeight: 50, // 最大高度
              ),
              child: passwordField,
            ),
          ),
          Container(
            child: hint,
            margin: const EdgeInsets.only(bottom: 35, left: 20),
            alignment: Alignment.centerLeft,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 175),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 300, // 最小寬度
                maxWidth: 380, // 最大寬度
                minHeight: 50, // 最小高度
                maxHeight: 50, // 最大高度
              ),
              child: confirmPasswordField,
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 300, // 最小寬度
              maxWidth: 380, // 最大寬度
              minHeight: 50, // 最小高度
              maxHeight: 50, // 最大高度
            ),
            child: continueButton,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10),
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      backgroundColor: const Color(0xFFEAEAEA),
      body: SingleChildScrollView(
        child: widget,
      ),
    );

    return appHomePage;
  }
}
