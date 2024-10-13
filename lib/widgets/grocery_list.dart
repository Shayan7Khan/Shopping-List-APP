import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_items.dart';
import 'package:shopping_list_app/widgets/new_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _addItem() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NewItem()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: ListView.builder(
          //using itemcount to make sure flutter really goes through all our grocery items
          itemCount: groceryItems.length,
          itemBuilder: (ctx, index) => ListTile(
                title: Text(groceryItems[index].name),
                //leading is for a widget that appears at the beginning  e.g color indicator for item categories
                leading: Container(
                  width: 24,
                  height: 24,
                  color: groceryItems[index].category.color,
                ),
                //trailing is something that appears at the end  e.g item quantity
                trailing: Text(groceryItems[index].quantity.toString()),
              )),
    );
  }
}
//comment from laptop