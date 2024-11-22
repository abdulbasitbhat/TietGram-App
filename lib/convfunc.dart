import 'dart:convert';
import 'package:http/http.dart' as http;

/*Future getdatasumm(url) async{
            //final tex=Itext.toString();
           // final url='http://127.0.0.1:5000/api?query=' + Itext;
            final response = await http.get(Uri.parse(url));
            final d= json.decode(response.body) as Map<String,dynamic>;
            print(d['output']);
            return d['output'];
        }
*/
getdatasumm(String url)async{
  http.Response response =await http.get(Uri.parse(url));
  //print(response.body);
  return response.body;
}