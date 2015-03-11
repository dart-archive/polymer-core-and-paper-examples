import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:template_binding/template_binding.dart';
export 'package:polymer/init.dart';

class Model extends Observable {
  @observable String value1;
  @observable String value2;
  @observable String committedValue1;
  @observable String committedValue2;
}

@initMethod
startup() {
  Polymer.onReady.then((_) {
    (querySelector('#myTemplate') as AutoBindingElement).model = new Model();
  });
}
