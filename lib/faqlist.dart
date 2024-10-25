import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'drawer.dart';
import 'sheet.dart';

class FaqlistScreen extends StatelessWidget{
  const FaqlistScreen({Key?key}):super(key:key);
  @override
  Widget build(BuildContext context){
    final appBar = AppBar(
      title: const Text("客戶服務 FAQ"),
      centerTitle: true,
      backgroundColor: Color(0xFF4B9BE1),
      foregroundColor: Color(0xFFFFFFFF),
    );

    final topic1 = const Text('Bezalel官方網站',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF000000),
      ),
    );

    final topic2 = const Text('24/7 在線客服',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF000000),
      ),
    );

    final topic3 = const Text('info.tw@bezalel.co',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF000000),
      ),
    );

    final topic4 = const Text('(05)-2242828',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF000000),
      ),
    );

    final service1 = ElevatedButton.icon(
      onPressed: () async {
        const url = 'https://bezalel.tw/?srsltid=AfmBOooqzPnAkCQUkSs-doxix_yg8f_mWzwAAvzmIQvJMt7dhwZ0IpDB';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      label: Column(
        children: [topic1],
      ),
      icon: SizedBox(
        child: Image.asset('assets/global.png'),
        width: 50.0,
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        alignment: Alignment.centerLeft,
        backgroundColor: Color(0xFFCFD1D6),
      ),
    );

    final service2 = ElevatedButton.icon(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SheetScreen())),
      label: Column(
        children: [
          topic2,
        ],
      ),

      icon: SizedBox(
        child: Image.asset('assets/support.png'),
        width: 50.0,
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        alignment: Alignment.centerLeft,
        backgroundColor: Color(0xFFCFD1D6),
      ),
    );

    final service3 = ElevatedButton.icon(
      onPressed: () async {
        final Uri emailLaunchUri = Uri(
          scheme: 'mailto',
          path: 'info.tw@bezalel.co',
          query: 'subject=Your Subject&body=Hello', // 你可以自訂主題和內容
        );

        if (await canLaunchUrl(emailLaunchUri)) {
          await launchUrl(emailLaunchUri);
        } else {
          throw 'Could not launch $emailLaunchUri';
        }
      },
      label: Column(
        children: [
          topic3,
        ],
      ),
      icon: SizedBox(
        child: Image.asset('assets/mail.png'),
        width: 50.0,
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        alignment: Alignment.centerLeft,
        backgroundColor: Color(0xFFCFD1D6),
      ),
    );

    final service4 = ElevatedButton.icon(
      onPressed: () async {
        const telUrl = 'tel:(05)-2242828';
        if (await canLaunch(telUrl)) {
          await launch(telUrl);
        } else {
          throw 'Could not launch $telUrl';
        }
      },
      label: Column(
        children: [
          topic4,
        ],
      ),
      icon: SizedBox(
        child: Image.asset('assets/telephone.png'),
        width: 50.0,
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        alignment: Alignment.centerLeft,
        backgroundColor: Color(0xFFCFD1D6),
      ),
    );

    
    final next = Image.asset('assets/back.png');


    final widget = Container(
      child: Column(
        children: <Widget>[
          Stack(
            children:
            [
              Container(
                child: service1,
                margin: const EdgeInsets.only(top: 30,left: 20,right: 20),
                width: 380,
              ),
              Container(
                child: Transform.rotate(angle: 3.141597 * 180 / 180,child: next,),
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(top: 65,right: 40),
              )
            ],
          ),

          Stack(
            children:
            [
              Container(child: service2,margin: const EdgeInsets.only(top: 30,left: 20,right: 20),width: 380,),
              Container(
                child: Transform.rotate(angle: 3.141597 * 180 / 180,child: next,),
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(top: 65,right: 40),
              )
            ],
          ),

          Stack(
            children:
            [
              Container(child: service3,margin: const EdgeInsets.only(top: 30,left: 20,right: 20),width: 380,),
              Container(
                child: Transform.rotate(angle: 3.141597 * 180 / 180,child: next,),
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(top: 65,right: 40),
              )
            ],
          ),

          Stack(
            children:
            [
              Container(child: service4,margin: const EdgeInsets.only(top: 30,left: 20,right: 20),width: 380,),
              Container(
                child: Transform.rotate(angle: 3.141597 * 180 / 180,child: next,),
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(top: 65,right: 40),
              )
            ],
          ),
        ],
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10),
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
      drawer: ResDrawer(),
      backgroundColor: const Color(0xFFEAEAEA),
    );

    return appHomePage;
  }
}