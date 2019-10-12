import 'package:flutter/material.dart';
import 'package:folk_payments/screens/view_product.dart';
import 'package:folk_payments/utilities/constants.dart';
import 'package:folk_payments/utilities/items.dart';
import 'package:folk_payments/custom_widgets/category.dart';
List categoryItem;

class Products extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  static const routeName = 'Products';
  final cat;
  Products({@required this.cat});

  @override
  Widget build(BuildContext context) {
    if(cat==1) categoryItem = cat1;
    if(cat==2) categoryItem = cat2;
    if(cat==3) categoryItem = cat3;
    if(cat==4) categoryItem = cat4;
    if(cat==5) categoryItem = cat5;
    return Scaffold(
      appBar: AppBar(
        title: Text('FOLK PAYMENT'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  InkWell(
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Center(
                    child: Text(
                      'Categories',
                      style: kInputBoxInputTextStyle.copyWith(
                        fontSize: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Category(
              catName: 'Category1',
              onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Products(cat: 1))),
            ),
            Category(
              catName: 'Category2',
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> Products(cat: 2))),
            ),
            Category(
              catName: 'Category3',
              onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=> Products(cat: 3))),
            ),
            Category(
              catName: 'Category4',
              onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> Products(cat: 4))),
            ),
            Category(
              catName: 'Category5',
              onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Products(cat: 5))),

            ),
          ],
        ),
      ),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            children: List.generate(
              categoryItem.length,
              (i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> View(index: i)));
                  },
                  child: GridTile(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Image.network(
                                categoryItem[i]['item_url'],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                          categoryItem[i]['item_name'],
                            style: kInputBoxInputTextStyle.copyWith(fontSize: 12.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '₹${categoryItem[i]['item_price']=='0'?'108':categoryItem[i]['item_price']}',
                            style: kInputBoxInputTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
