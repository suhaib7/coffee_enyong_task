import 'package:flutter/material.dart';
import 'global.dart';
import 'items.dart';
import 'items_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_enyong_task/global.dart' as globals;

class SelectedItem extends StatefulWidget {
  const SelectedItem(this.items, {super.key});

  final ItemsList items;

  @override
  State<SelectedItem> createState() => _SelectedItemState();
}

class _SelectedItemState extends State<SelectedItem> {
  double _sizeSliderValue = 2;
  double? newSizeSliderValue;

  double _sugarSliderValue = 20;
  double? newSugarSliderValue;

  bool selected1 = true;
  bool selected2 = false;

  bool isSSelected = false;
  bool isMSelected = true;
  bool isLSelected = false;

  bool isSelected0 = true;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;

  bool selected3 = false;
  bool selected4 = false;
  bool selected5 = false;

  double? newPrice;

  List<ItemsList> items = [
    ItemsList('lib/assets/images/img0.png', 'Latte', 9.66, 'description'),
    ItemsList('lib/assets/images/img1.png', 'Cappucino', 10.99, 'description'),
    ItemsList('lib/assets/images/img2.png', 'Dalgona', 10.55, 'description'),
    ItemsList('lib/assets/images/img3.png', 'Americano', 9.55, 'description')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/background2.jpg'),
              fit: BoxFit.fill),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Items(items: items[0],)));
                    });
                  },
                  icon: const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Icon(
                      Icons.list,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 250),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Image.asset(
                    'lib/assets/images/Group4.png',
                      width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Hero(
                tag: widget.items.imgName,
                child: Image.asset(
                  widget.items.imgName,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            const Positioned(
              top: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Coffee\nEnyong',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 230,
                  ),
                  Text(
                    'It\'s Coffee\nTime',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 270,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'lib/assets/images/1231231.jpg',
                  fit: BoxFit.fill,
                  width: 450,
                  height: 550,
                ),
              ),
            ),
            Positioned(
              top: 245,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF6E4821),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      widget.items.drinkName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 310,
              child: Text(
                widget.items.description,
                style: const TextStyle(
                  color: Color(0xFF774D3C),
                  fontSize: 26,
                ),
              ),
            ),
            Positioned(
              top: 370,
              bottom: 30,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 130),
                    child: Row(
                      children: [
                        Text(
                          'S',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Text(
                          'M',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Text(
                          'L',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          'Size',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 38,
                              color: Color(0xFF774D3C),
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ),
                      ),
                      const SizedBox(width: 50,),
                      SliderTheme(
                        data: const SliderThemeData(
                          thumbColor: Color(0xFF815236),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                        ),
                        child: SizedBox(
                          width: 270,
                          child: Slider(
                              value: _sizeSliderValue,
                              max: 3,
                              min: 1,
                              divisions: 2,
                              onChangeEnd: (v){
                                setState(() =>
                                _sizeSliderValue = v);
                              },
                              inactiveColor: Colors.white,
                              onChanged: (newCurrentSliderValue) {

                              }
                              ),
                        ),
                      ),
                    ],
                  ),
                  isDrink(globals.pageIndex)!,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 160,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF885031),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(child: Text(getNewPrice().toString(),style:
                          const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),)),
                      ),
                      const SizedBox(width: 40,),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xFF966940),
                          ),
                          child: const Center(child: Text('Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          ),
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
  }
  double getNewPrice(){
    if(_sizeSliderValue == 1){
      return widget.items.price;
    }
    else if(_sizeSliderValue == 2){
      return widget.items.price + 3;
    }
    else if(_sizeSliderValue == 3){
      return widget.items.price + 5;
    }else{
      return 0;
    }
  }

  Widget? isDrink(int pageIndex){
    switch(pageIndex){
      case 0 || 1 || 2:
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Text(
                    'Temperature',
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 28,
                          color: Color(0xFF774D3C),
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selected1
                          ? const Color(0xFFC28C62)
                          : const Color(0xFF825136),
                    ),
                    onPressed: () {
                      setState(() {
                        selected1 = true;
                        selected2 = false;
                      });
                    },
                    child: const Text('Hot'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selected2
                          ? const Color(0xFFC28C62)
                          : const Color(0xFF825136),
                    ),
                    onPressed: () {
                      setState(() {
                        selected1 = false;
                        selected2 = true;
                      });
                    },
                    child: const Text('Ice'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40,),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 290),
                  child: Text(
                    'Sugar',
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 34,
                          color: Color(0xFF774D3C),
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 55),
                  child: Row(
                    children: [
                      SliderTheme(
                        data: const SliderThemeData(
                          thumbColor: Color(0xFF815236),
                          thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15),
                        ),
                        child: SizedBox(
                          width: 300,
                          child: Slider(
                              value: _sugarSliderValue,
                              max: 100,
                              divisions: 5,
                              inactiveColor: Colors.white,
                              onChanged: (newCurrentSliderValue) {
                                setState(() => _sugarSliderValue =
                                    newCurrentSliderValue);
                              }),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF774D3C)),
                        child: Center(
                          child: Text(
                            '$_sugarSliderValue%'.replaceAll('.0', ""),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 300),
                      child: Text(
                        'Milk',
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 36,
                              color: Color(0xFF774D3C),
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              TextButton(onPressed: () {
                                setState(() {
                                  isSelected0 = true;
                                  isSelected1 = false;
                                  isSelected2 = false;
                                  isSelected3 = false;
                                });
                              } , child: const Text('None',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              ),
                              Container(
                                height: 5,
                                width: 80,
                                color: isSelected0 ? const Color(0xFF8D7060) : Colors.transparent,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextButton(onPressed: () {
                                setState(() {
                                  isSelected0 = false;
                                  isSelected1 = true;
                                  isSelected2 = false;
                                  isSelected3 = false;
                                });
                              } , child: const Text('Oat Milk',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              ),
                              Container(
                                height: 5,
                                width: 90,
                                color: isSelected1 ? const Color(0xFF8D7060) : Colors.transparent,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextButton(onPressed: () {
                                setState(() {
                                  isSelected0 = false;
                                  isSelected1 = false;
                                  isSelected2 = true;
                                  isSelected3 = false;
                                });
                              } , child: const Text('Soy Milk',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              ),
                              Container(
                                height: 5,
                                width: 90,
                                color: isSelected2 ? const Color(0xFF8D7060) : Colors.transparent,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextButton(onPressed: () {
                                setState(() {
                                  isSelected0 = false;
                                  isSelected1 = false;
                                  isSelected2 = false;
                                  isSelected3 = true;
                                });
                              } , child: const Text('Almond Milk',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              ),
                              Container(
                                height: 5,
                                width: 90,
                                color: isSelected3 ? const Color(0xFF8D7060) : Colors.transparent,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
          ],
        );

      case 3:
        return Column(
          children: [
            const SizedBox(height: 40,),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 320),
                  child: Text(
                    'Salt',
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 34,
                          color: Color(0xFF774D3C),
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 55),
                  child: Row(
                    children: [
                      SliderTheme(
                        data: const SliderThemeData(
                          thumbColor: Color(0xFF815236),
                          thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15),
                        ),
                        child: SizedBox(
                          width: 300,
                          child: Slider(
                              value: _sugarSliderValue,
                              max: 100,
                              divisions: 5,
                              inactiveColor: Colors.white,
                              onChanged: (newCurrentSliderValue) {
                                setState(() => _sugarSliderValue =
                                    newCurrentSliderValue);
                              }),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF774D3C)),
                        child: Center(
                          child: Text(
                            '$_sugarSliderValue%'.replaceAll('.0', ""),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 300),
                      child: Text(
                        'Sauce',
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 36,
                              color: Color(0xFF774D3C),
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Ketchup',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Checkbox(
                            activeColor: Colors.orange,
                              checkColor: Colors.black,
                              value: selected3,
                              onChanged: (newBool){
                            setState(() {
                              selected3 = newBool!;
                            });
                          }),
                          const Text('Mayonnaise',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Checkbox(
                              activeColor: Colors.orange,
                              checkColor: Colors.black,
                              value: selected4,
                              onChanged: (newBool){
                                setState(() {
                                  selected4 = newBool!;
                                });
                              }),
                          const Text('Mustard',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Checkbox(
                              activeColor: Colors.orange,
                              checkColor: Colors.black,
                              value: selected5,
                              onChanged: (newBool){
                                setState(() {
                                  selected5 = newBool!;
                                });
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height:80,)
          ],
        );
    }
    return null;
  }
}
