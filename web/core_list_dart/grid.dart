import 'dart:math';
import 'package:polymer/polymer.dart';
export 'package:polymer/init.dart';

@CustomTag('list-test')
class ListTest extends PolymerElement {
  @observable ObservableList data;

  ListTest.created() : super.created();

  ready() {
    var newData = new ObservableList();
    var rand = new Random();
    for (var i = 0; i < 1000; i++) {
      var color = (rand.nextDouble() * 0xFFFFFF).floor().toRadixString(16);
      newData.add({
        'image': 'http://placehold.it/150x150/${color}/ffffff&text=Index%20$i',
        'caption': 'Caption $i',
        'color': color
      });
    }
    data = newData;
  }
}
