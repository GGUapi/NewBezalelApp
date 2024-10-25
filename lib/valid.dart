import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'register.dart';
import 'sync.dart';
import 'function/changeNotifier.dart';
import 'newpassword.dart';

class ValidMainScreen extends StatefulWidget {
  const ValidMainScreen({Key? key}) : super(key: key);

  @override
  _ValidMainScreenState createState() => _ValidMainScreenState();
}

class _ValidMainScreenState extends State<ValidMainScreen> {
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // 監聽所有 TextField 的變化
    for (var controller in _controllers) {
      controller.addListener(_validateInputs);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  // 檢查是否所有的 TextField 都已經輸入內容
  void _validateInputs() {
    setState(() {
      _isButtonEnabled = _controllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  // 顯示SnackBar通知
  void _showResendNotification(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('已再次發送驗證碼'),
        duration: Duration(seconds: 2), // 控制通知顯示時間
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final email = Provider.of<EmailProvider>(context).email;
    final appBar = AppBar(
      title: const Text('帳號同步'),
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

    final topic1 = Text(
      '請填寫電子郵件 $email\n收到的驗證碼',
      style: const TextStyle(
        fontSize: 16,
      ),
    );

    final topic2 = const Text(
      '驗證碼',
      style: TextStyle(
        fontSize: 24,
      ),
    );

    final btn1 = TextButton(
      onPressed: () {
        // 顯示 "已再次發送驗證碼" 的通知
        _showResendNotification(context);
      },
      child: const Text(
        '再次發送',
        style: TextStyle(fontSize: 18),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        foregroundColor: const Color(0xFF000000),
      ),
    );

    final btn2 = ElevatedButton(
      onPressed: _isButtonEnabled
          ? () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NewPasswordScreen()),
      )
          : null, // 如果所有驗證碼未填寫完整則禁用按鈕
      child: const Text('繼續'),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        foregroundColor: const Color(0xFFFFFFFF),
        backgroundColor: _isButtonEnabled
            ? const Color(0xFF000000) // 背景變為黑色
            : const Color(0xFFC4C4C5), // 背景為灰色
      ),
    );

    final widget = Container(
      child: Column(
        children: <Widget>[
          Container(
            child: topic1,
            margin: const EdgeInsets.only(bottom: 120, top: 130),
            alignment: Alignment.center,
          ),
          Container(
            child: topic2,
            margin: const EdgeInsets.only(bottom: 25),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 50, left: 50, right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 40,
                  child: TextField(
                    controller: _controllers[index],
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      filled: true, // 背景為填充色
                      fillColor: const Color(0xFFCFD1D6), // 背景顏色
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0), // 設置內邊距
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // 移除邊框
                        borderRadius: BorderRadius.circular(0.0), // 設置圓角
                      ),
                      counterText: '',
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                  ),
                );
              }),
            ),
          ),
          Container(
            child: btn1,
            margin: const EdgeInsets.only(bottom: 70),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 300, // 最小寬度
              maxWidth: 380, // 最大寬度
              minHeight: 50, // 最小高度
              maxHeight: 50, // 最大高度
            ),
            child: btn2,
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
