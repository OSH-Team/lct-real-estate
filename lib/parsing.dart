import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:osh_main_build/entities/calc.dart';
import 'package:chaquopy/chaquopy.dart';
import 'package:starflut/starflut.dart';
import 'entities/realty.dart';
class Parsing{
  String mainUrl = 'https://www.avito.ru/';
  _getDocument(String url) async{
    final response = await http.Client().get(Uri.parse(url));
    if(response.statusCode == 200){
      var doc = parse(response.body);
      return doc;
    }else{
      throw Exception();
    }
  }
  List<Realty> getMatchRealties(){
    List<Realty> realties = [];
    Starflut.loadLibrary('cianparser');

    return realties;
  }
  List<String> _getMatchAddresses(Calc calc){
    List<String> matchAddresses = [];
    var document = _getDocument(mainUrl);

    return matchAddresses;
  }
}