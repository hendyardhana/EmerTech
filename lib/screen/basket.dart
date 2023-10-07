import 'package:flutter/material.dart';
import '../class/recipe.dart';

class Basket extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  @override
  void initState() {
    super.initState();
  }

  Widget widRecipes(BuildContext context, int index) {
      Widget w = Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: -6,
              blurRadius: 8,
              offset: Offset(8, 7),
            ),
          ]),
          child: Card(
              child: Column(children: [
            Container(
                margin: EdgeInsets.all(15),
                child: Text(
                  recipes[index].name,
                  style: Theme.of(context).textTheme.headlineSmall,
                )),
            Container(
                margin: const EdgeInsets.all(15),
                child: Text(
                  recipes[index].category,
                  style: Theme.of(context).textTheme.labelSmall,
                )),
            Image.network(recipes[index].photo),
            Container(
              margin: const EdgeInsets.all(20),
              child: Text(recipes[index].desc),
            ),
            ElevatedButton.icon(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5),
                  backgroundColor:
                      MaterialStateProperty.resolveWith(getButtonColor),
                ),
                onPressed: () {
                  setState(() {
                    widRecipes(context, index);
                  });
                  recipes.removeWhere((element) => element.id == recipes[index].id);
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Remove Recipe'),
                            content: const Text('Recipe successfully removed'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'OK');
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ));
                },
                icon: const Icon(Icons.remove),
                label: const Text("Delete Recipe"))
          ])));
          return w;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
      ),
      // body: Center(
      //   child: Column(children: [
      //     Text("This is Basket"),
      //     ElevatedButton(
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => ItemBasket(1, 10)));
      //         },
      //         child: Text("Item 1")),
      //     ElevatedButton(
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => ItemBasket(2, 14)));
      //         },
      //         child: Text("Item 2"))
      //   ]),
      // ),
      body: SingleChildScrollView(
          child: Column(children: [
        // ListView(
        //     shrinkWrap: true,
        //     physics: const NeverScrollableScrollPhysics(),
        //     children: widRecipes(context)),
        ListView.builder(
          itemCount: recipes.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => widRecipes(context, index)),
        const Divider(
          height: 100,
        )
      ])),
    );
  }

  Color getButtonColor(Set<MaterialState> states) {
    return Colors.red;
  }
}
