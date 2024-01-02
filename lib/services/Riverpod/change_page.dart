import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageNum extends ChangeNotifier {
  int pagenum = 1;
  void increase() {
    pagenum++;
    notifyListeners();
  }

  void decrease() {
    if(pagenum > 1 ){
    pagenum--;}
    notifyListeners();
  }
}

final PageNumber = ChangeNotifierProvider<PageNum>((ref) {
  return PageNum();
});
