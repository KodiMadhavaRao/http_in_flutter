import 'package:dio_http/dto/users.dart';

class parseJson {


  static List<Users> responseparser(var jsonResponse) {
    List<Users> clUsersList=new List();
    List clDynamic = jsonResponse["results"];
    for (int i = 0; i < clDynamic.length; i++) {
      Users users = new Users.name(
          clDynamic[i]["gender"],
          clDynamic[i]["name"]["title"] + " " + clDynamic[i]["name"]["first"] + " " +
              clDynamic[i]["name"]["last"],
          clDynamic[i]["email"],
          clDynamic[i]["phone"],
          clDynamic[i]["cell"],
          clDynamic[i]["nat"],
          clDynamic[i]["dob"]["date"],
          clDynamic[i]["dob"]["age"].toString(),
          clDynamic[i]["picture"]["medium"]);
      clUsersList.add(users);
    }
    return clUsersList;
  }

}