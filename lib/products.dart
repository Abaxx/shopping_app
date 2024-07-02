import 'package:flutter/material.dart';
import 'package:shopping_app/checkout.dart';

class Products extends StatelessWidget {
  Products({super.key});

  final productList = <String>['Sneaker','T-Shirt','Jacket','Jeans','Trouser'];
  final imageList = <String>['assets/images/sneaker.jpeg','assets/images/shirt.jpeg','assets/images/jacket.jpg',
    'assets/images/jeans.jpeg','assets/images/trouser.jpeg'];
  static List checkoutList = <String>[];
  static List checkoutImageList = <String>[];

  void addItemToList(String itemName,String itemImage,){
    checkoutList.add(itemName);
    checkoutImageList.add(itemImage);
  }

  showSnackBar(String message){
    return SnackBar(
        content: Text(message),
      duration: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(5),
      itemCount: productList.length,
      itemBuilder: (BuildContext ctx,int index){
        return Card(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width ,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageList[index]),
                      fit: BoxFit.fill
                  ),
                ),
                alignment: Alignment.center,
                child:  Text(productList[index],style: TextStyle(color: Colors.white,fontSize: 30),),
              ),
              SizedBox(
                width: double.infinity,
                child: IconButton(
                  onPressed: (){
                    addItemToList(productList[index],imageList[index]);
                    ScaffoldMessenger.of(context).showSnackBar(showSnackBar('Added to Checkout'));
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> Checkout(name: productList[index],)));
                  },
                  icon: const Icon(Icons.add_shopping_cart_sharp,size: 30,color: Colors.white,),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}