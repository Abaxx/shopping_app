
import 'package:flutter/material.dart';
import 'package:shopping_app/products.dart';
import 'package:shopping_app/success_screen.dart';

class Checkout extends StatefulWidget {

  Checkout({super.key,});

  @override
  State<Checkout> createState() => _CheckoutState();

}

class _CheckoutState extends State<Checkout> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(5),
      itemCount: Products.checkoutList.length,
      itemBuilder: (BuildContext context, int index){
        return Card(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width ,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Products.checkoutImageList[index]),
                      fit: BoxFit.fill
                  ),
                ),
                alignment: Alignment.center,
                child:  Text('${Products.checkoutList[index]}',style: TextStyle(color: Colors.white,fontSize: 30),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: (){
                      setState(() {
                        Products.checkoutList.removeAt(index);
                        Products.checkoutImageList.removeAt(index);
                      });
                    },
                    child: Text('Remove'),
                  ),
                  TextButton(
                      onPressed: (){
                        setState(() {
                          Products.checkoutList.removeAt(index);
                          Products.checkoutImageList.removeAt(index);
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SuccessScreen()));
                      },
                      child: Text('Order')
                  )
                ],
              )
            ],
          ),
        );
      }
    );
  }

}