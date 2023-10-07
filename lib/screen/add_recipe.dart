import 'package:flutter/material.dart';
import '../class/recipe.dart';

class AddRecipe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddRecipeState();
  }
}

class _AddRecipeState extends State<AddRecipe> {
  final TextEditingController _recipe_name_cont = TextEditingController();
  final TextEditingController _recipe_desc_cont = TextEditingController();
  final TextEditingController _recipe_photo_cont = TextEditingController();
  String _recipe_category = "Traditional";
  int _charleft = 0;
  @override
  void initState() {
    super.initState();
    _recipe_name_cont.text = "your food name";
    _recipe_desc_cont.text = "Recipe of..";
    _charleft = 200 - _recipe_desc_cont.text.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Recipe'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _recipe_name_cont,
            onChanged: (v) {
              print(_recipe_name_cont.text);
              // print(v);
            },
          ),
          TextField(
            controller: _recipe_desc_cont,
            onChanged: (v) {
              setState(() {
                _charleft = 200 - v.length;
              });
              print(_recipe_desc_cont.text);
              // print(v);
            },
            keyboardType: TextInputType.multiline,
            minLines: 4,
            maxLines: null,
          ),
          Text("char left : $_charleft"),
          TextField(
            controller: _recipe_photo_cont,
            onSubmitted: (v) {
              setState(() {});
            },
          ),
          Image.network(_recipe_photo_cont.text),
          DropdownButton(
              value: _recipe_category,
              items: const [
                DropdownMenuItem(
                  value: "Traditional",
                  child: Text("Traditional"),
                ),
                DropdownMenuItem(
                  value: "Japanese",
                  child: Text("Japanese"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _recipe_category = value.toString();
                });
              }),
          ElevatedButton.icon(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                backgroundColor:
                    MaterialStateProperty.resolveWith(getButtonColor),
              ),
              onPressed: () {
                recipes.add(Recipe(
                  id: recipes.length + 1,
                  name: _recipe_name_cont.text,
                  desc: _recipe_desc_cont.text,
                  photo: _recipe_photo_cont.text,
                  category: _recipe_category
                ));
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: const Text('Add Recipe'),
                          content: const Text('Recipe successfully added'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'OK');
                                _recipe_name_cont.text = "your food name";
                                _recipe_desc_cont.text = "Recipe of ..";
                                _recipe_photo_cont.text = "";
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ));
              },
              icon: const Icon(Icons.add),
              label: const Text('SUBMIT')),
        ],
      ),
    );
  }

  Color getButtonColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }
}
