import 'package:flutter/material.dart';

import 'json_part.dart';

void main() {
  runApp(const MyApp());
}

/*
  ## 웹상에 있는 Json 데이터 실패 없이 끌어와서 보여주기
  - 출처 : 유튜버 코딩쉐프, https://www.youtube.com/watch?v=bQN8LP3CR20

  JsonData는 JsonPlaceholder 사이트에서 제공하는 더미데이터를 사용
  - https://jsonplaceholder.typicode.com/

  Resource 섹션에 users라는 항목이 json형태로 10명의 더미 데이터가 들어 있다.

  JsonData를 사용하기 위해서 Model 클래스를 만들 때에는 기본적인 절차가 있다.
  - JsonData가 있으면 JsonData를 Decode하거나 Encode할 클래스를 만들어줘야 한다.
  - factory 생성자를 사용해서 fromJson 메서드로는 JsonData를 dart 오브젝트로 변환시키고,
  - toJson 메소드는 반대로 dart 오브젝트에서 JsonData로 변환시킨다.

  보통 Json 파일 내에는 하나의 객체 내에 여러 개의 객체가 들어있다.
  그렇다면 또 다시 각각의 클래스를 만들고, 메뉴얼적으로 JsonDecode 또는 Encode를 위해서 코딩을 해주어야 할 것이다.

  모델 클래스를 손쉽게 생성하기 위한 사이트
  - https://app.quicktype.io/
  - 우측 상단에 언어 설정
  - 좌측 상단에 클래스명 지정
  - JsonData를 모두 복사하여 좌측 창에 붙여넣기 해주면 자동으로 모델 클래스를 생성해준다.





 */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsonParse()
    );
  }
}
