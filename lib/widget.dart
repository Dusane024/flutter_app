import 'package:flutter/material.dart';
import 'catalog.dart';
class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key key,  this.item}) : assert(item!=null),super(key: key);
  @override
  Widget build(BuildContext context) {
    print(item.image);
    return ListTile(
      leading: Image.network(item.image,height: 140,width: 100,),
      title: Text('${item.name}'),
      subtitle: Text('${item.desc}'),
      trailing: Text("\$"+item.price.toString()),

    );
  }
}
