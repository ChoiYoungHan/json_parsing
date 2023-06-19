import 'package:flutter/material.dart';
import 'package:json_app/user.dart';
import 'service.dart';

class JsonParse extends StatefulWidget {
  const JsonParse({super.key});

  @override
  State<JsonParse> createState() => _JsonParseState();
}

class _JsonParseState extends State<JsonParse> {

  List<User> _user = <User>[]; // 객체 생성
  bool loading = false; // 사용자에게 로딩 여부를 알려주기 위해 bool 타입의 loading 변수 선언

  @override
  void initState() { // 매번 JsonParse 위젯이 생성될 때마다 getInfo 메소드를 불러옴
    // TODO: implement initState
    super.initState();
    Services.getInfo().then((value){ // getInfo 메소드를 불러온 뒤 value값을 전달해줌
      setState(() {
        _user = value;
        loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loading ? 'User' : 'Loading...')
      ),
      body: ListView.builder(
        itemCount: _user.length,
        itemBuilder: (context, index){
          User user = _user[index];
          return ListTile(
            leading: const Icon( // Tile 좌측에 아이콘을 배치
              Icons.account_circle_rounded,
              color: Colors.blue,
            ),
            trailing: IconButton( // Tile 우측에 아이콘 버튼을 배치
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog( // 팝업 화면으로 사용자의 정보를 보여줌
                      title: Text(user.name),
                      content: Column( // 사용자의 이름, 전화번호, close버튼을 배치하기 위함
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(user.phone),
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close', style: TextStyle(color: Colors.black))
                          )
                        ]
                      ),
                    );
                  }
                );
              },
              icon: const Icon(
                Icons.phone_android_outlined,
                color: Colors.red,
              ),
            ),
            title: Text(user.name), // 이름 출력
            subtitle: Text(user.email) // 이메일 주소 출력
          );
        }
      ),
    );
  }
}
