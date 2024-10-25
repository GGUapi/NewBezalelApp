import 'package:flutter/material.dart';
import 'register.dart';
import 'drawer.dart';
import 'package:provider/provider.dart';
import 'function/changeNotifier.dart';
import 'valid.dart';

class SyncMainScreen extends StatefulWidget {
  const SyncMainScreen({Key? key}) : super(key: key);

  @override
  _SyncMainScreenState createState() => _SyncMainScreenState();
}

class _SyncMainScreenState extends State<SyncMainScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // 監聽TextField變化
    _nameController.addListener(() {
      setState(() {
        _isButtonEnabled = _nameController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

    final topic = const Text(
      '請填寫用於申請網路帳戶的電子郵件',
      style: TextStyle(
        fontSize: 16,
      ),
    );

    final nameField = TextField(
      controller: _nameController,
      decoration: InputDecoration(
        filled: true, // 設置為true，使背景為填充色
        fillColor: const Color(0xFFCFD1D6), // 設置背景顏色
        hintText: '電子郵件', // 設置提示文字
        hintStyle: const TextStyle(
          color: Colors.white, // 設置提示文字的顏色
          fontSize: 14.0,
        ),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // 設置內邊距
        border: OutlineInputBorder(
          borderSide: BorderSide.none, // 移除邊框線
          borderRadius: BorderRadius.circular(0.0), // 設置圓角
        ),
      ),
    );

    final btn = ElevatedButton(
      onPressed: _isButtonEnabled
          ? () {
        // 使用 Provider 保存 Email
        Provider.of<EmailProvider>(context, listen: false)
            .setEmail(_nameController.text);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ValidMainScreen()),
        );
      }
          : null, // 如果按鈕不可用，則 onPressed 設為 null
      child: const Text('繼續'),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        foregroundColor: const Color(0xFFFFFFFF),
        backgroundColor: _isButtonEnabled
            ? const Color(0xFF000000)
            : const Color(0xFFC4C4C5), // 如果可點擊背景為黑色，否則灰色
      ),
    );

    final widget = Container(
      child: Column(
        children: <Widget>[
          Container(
            child: topic,
            margin: const EdgeInsets.only(bottom: 70, left: 35, top: 160),
            alignment: Alignment.centerLeft,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 240),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 300, // 最小寬度
                maxWidth: 380, // 最大寬度
                minHeight: 50, // 最小高度
                maxHeight: 50, // 最大高度
              ),
              child: nameField,
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 300, // 最小寬度
              maxWidth: 380, // 最大寬度
              minHeight: 50, // 最小高度
              maxHeight: 50, // 最大高度
            ),
            child: btn,
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
