import 'dart:html';
import 'dart:js';
import 'package:core_elements/core_animated_pages.dart';
import 'package:polymer/polymer.dart';
export 'package:polymer/init.dart';

@CustomTag('grid-toc')
class GridToc extends PolymerElement {
  @observable int selected;
  @observable int lastSelected;
  @observable List<int> items;

  GridToc.created() : super.created();

  void selectedChanged(int old) {
    lastSelected = old;
  }

  void selectView(e) {
    var target = new JsObject.fromBrowserObject(e)['target'];
    try {
      fire('grid-toc-select', detail: {'item': int.parse(target.text)});
    } catch(_) {}
  }
}

@CustomTag('grid-item')
class GridItem extends PolymerElement {
  @observable bool isSelected = false;
  @observable bool isHero;
  @observable int item;

  GridItem.created() : super.created();
}

class ViewClass extends Observable {
  @observable List<int> items = [];
  @observable int selected;
  int lastSelected;
  final $;

  ViewClass(this.$, {int count: 50}) {
    for (int i = 0; i < count; i++) {
      items.add(i);
    }
  }

  CoreAnimatedPages get pages => $['pages'];

  void selectView(e) {
    var i = new JsObject.fromBrowserObject(e)['detail']['item'];
    pages.selected = i + 1;
    selected = pages.selected;
  }

  void back() {
    lastSelected = pages.selected;
    pages.selected = 0;
    selected = pages.selected;
  }

  void transitionEnd() {
    if (lastSelected != null || lastSelected == 0) {
      lastSelected = null;
    }
  }
}

@initMethod
startup() {
  Polymer.onReady.then((_) {
    var template = querySelector('#myTemplate') as AutoBindingElement;
    template.model = new ViewClass(template.$);
  });
}
