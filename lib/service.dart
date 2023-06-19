import 'package:http/http.dart' as http;
import 'package:json_app/user.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Services{
  // 변하지 않는 주소의 값이나 설정 정보 같은 데이터에 접근하는 데 있어서
  // 매번 메모리에 로딩을 해서 값을 읽어들이는 것보다 전역변수와 같은 개념으로 접근하는 것이 비용도 줄이고 효율도 높일 수 있다.
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  // getInfo 메소드는 User를 통해서 전달되는 데이터를 다루어야 함으로 메소드의 타입은 Future, List 타입이어야 한다.
  static Future<List<User>> getInfo() async {
    try{
      // 서버와 통신이 될 때까지 기다림
      final response = await http.get(Uri.parse(url));

      // 정상적으로 통신하였을 경우
      if(response.statusCode == 200){
        final List<User> user = userFromJson(response.body); // Json 파싱을 끝내고 user를 리턴함
        return user;
      } else { // 인터넷 접속 불량 등의 문제 발생 시
        Fluttertoast.showToast(msg: 'Error occured. Please try again'); // 실패 시의 오류 메시지 출력 및 빈 리스트를 리턴
        return <User>[];
      }

    } catch (e){
      Fluttertoast.showToast(msg: e.toString()); // 에러가 발생했을 경우에도 Toast 메시지를 보여주고, 빈 리스트를 리턴
      return <User>[];
    }
  }
}