import 'package:coffee_enyong_task/selected_item.dart';
import 'package:flutter/material.dart';
import 'items_class.dart';
import 'package:coffee_enyong_task/global.dart' as globals;

class Items extends StatefulWidget {
  const Items({super.key, required this.items});

  final ItemsList items;

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  final TextEditingController _searchController = TextEditingController();

  List<ItemsList> items = [
    ItemsList('lib/assets/images/img0.png', 'Latte', 9.66, 'description'),
    ItemsList('lib/assets/images/img1.png', 'Cappucino', 10.99, 'description'),
    ItemsList('lib/assets/images/img2.png', 'Dalgona', 10.55, 'description'),
    ItemsList('lib/assets/images/img3.png', 'Americano', 9.55, 'description')
  ];

  List<ItemsList> teaItems = [
    ItemsList('lib/assets/images/img4.png', 'Red Tea', 9.66, 'description'),
    ItemsList('lib/assets/images/img5.png', 'Iced Tea', 10.99, 'description'),
    ItemsList('lib/assets/images/img6.png', 'Green Tea', 10.55, 'description'),
  ];

  List<ItemsList> chocolateItems = [
    ItemsList('lib/assets/images/img7.png', 'Chocolate', 9.66, 'description'),
    ItemsList(
        'lib/assets/images/img8.png', 'Iced chocolate', 10.99, 'description'),
    ItemsList(
        'lib/assets/images/img9.png', 'Hot chocolate', 10.55, 'description'),
  ];

  List<ItemsList> foodItems = [
    ItemsList('lib/assets/images/img10.png', 'Burger', 9.66, 'description'),
    ItemsList('lib/assets/images/img11.png', 'Salad', 10.99, 'description'),
    ItemsList('lib/assets/images/img12.png', 'Steak', 10.55, 'description'),
  ];

  bool isEven = false;

  bool isSelected1 = true;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/images/Group2.png'),
                fit: BoxFit.fill),
          ),
          child: Stack(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'COFFEE NYONG',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Image.asset('lib/assets/images/Group4.png'),
                ],
              ),
              const Positioned(
                top: 85,
                left: 10,
                child: Text(
                  'your daily coffee needs',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140, left: 30),
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'search you favourite coffee',
                      hintStyle: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _searchController.clear(),
                      ),
                      fillColor: const Color(0xFF3B2822),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 210,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Image.asset(
                        'lib/assets/images/1231.png',
                        fit: BoxFit.fill,
                        width: 500,
                        height: 600,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 230),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  globals.pageIndex = 0;
                                  isSelected1 = true;
                                  isSelected2 = false;
                                  isSelected3 = false;
                                  isSelected4 = false;
                                });
                              },
                              child: const Text(
                                'Coffee',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              height: 5,
                              width: 50,
                              color: isSelected1 ? const Color(0xFF8D7060) : Colors.transparent,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  globals.pageIndex = 1;
                                  isSelected1 = false;
                                  isSelected2 = true;
                                  isSelected3 = false;
                                  isSelected4 = false;
                                });
                              },
                              child: const Text(
                                'Tea',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              height: 5,
                              width: 50,
                              color: isSelected2 ? const Color(0xFF8D7060) : Colors.transparent,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  globals.pageIndex = 2;
                                  isSelected1 = false;
                                  isSelected2 = false;
                                  isSelected3 = true;
                                  isSelected4 = false;
                                });
                              },
                              child: const Text(
                                'Chocolate',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              height: 5,
                              width: 50,
                              color: isSelected3 ? const Color(0xFF8D7060) : Colors.transparent,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  globals.pageIndex = 3;
                                  isSelected1 = false;
                                  isSelected2 = false;
                                  isSelected3 = false;
                                  isSelected4 = true;
                                });
                              },
                              child: const Text(
                                'Food',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              height: 5,
                              width: 50,
                              color: isSelected4 ? const Color(0xFF8D7060) : Colors.transparent,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: page(globals.pageIndex)!,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 290, top: 20),
                              child: Text(
                                'Popular',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 405,
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xFF753C00),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  children: [
                                    Image.asset(items[3].imgName),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              items[3].drinkName,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            const Icon(Icons.electric_bolt),
                                            const Icon(Icons.electric_bolt),
                                            const Icon(Icons.electric_bolt),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 180, top: 20),
                                          child: Text(
                                            items[3].description,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 220, top: 10),
                                          child: Text(
                                            items[3].price.toString(),
                                            style: const TextStyle(
                                              color: Colors.white60,
                                              fontSize: 24,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget? page(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectedItem(items[index])));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: 300,
                          width: 230,
                          color: Colors.transparent,
                        ),
                      ),
                      Container(
                        width: 230,
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF542A02),
                        ),
                        child: Column(
                          children: [
                            Hero(
                              tag: items[index].imgName,
                              child: Image.asset(
                                items[index].imgName,
                                width: 150,
                                height: 150,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              items[index].drinkName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '\$${items[index].price}',
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 30,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      case 1:
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: teaItems.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SelectedItem(teaItems[index])));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: 300,
                          width: 230,
                          color: Colors.transparent,
                        ),
                      ),
                      Container(
                        width: 230,
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF542A02),
                        ),
                        child: Column(
                          children: [
                            Hero(
                              tag: teaItems[index].imgName,
                              child: Image.asset(
                                teaItems[index].imgName,
                                width: 150,
                                height: 150,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              teaItems[index].drinkName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '\$${teaItems[index].price}',
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 30,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      case 2:
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: chocolateItems.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SelectedItem(chocolateItems[index])));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: 300,
                          width: 230,
                          color: Colors.transparent,
                        ),
                      ),
                      Container(
                        width: 230,
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF542A02),
                        ),
                        child: Column(
                          children: [
                            Hero(
                              tag: chocolateItems[index].imgName,
                              child: Image.asset(
                                chocolateItems[index].imgName,
                                width: 150,
                                height: 150,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              chocolateItems[index].drinkName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '\$${chocolateItems[index].price}',
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 30,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      case 3:
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: foodItems.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SelectedItem(foodItems[index])));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: 300,
                          width: 230,
                          color: Colors.transparent,
                        ),
                      ),
                      Container(
                        width: 230,
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF542A02),
                        ),
                        child: Column(
                          children: [
                            Hero(
                              tag: foodItems[index].imgName,
                              child: Image.asset(
                                foodItems[index].imgName,
                                width: 150,
                                height: 150,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              foodItems[index].drinkName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '\$${foodItems[index].price}',
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 30,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
    }
    return null;
  }
}
