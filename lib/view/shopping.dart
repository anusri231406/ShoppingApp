import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height*1,
        width: width*1,
        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: NetworkImage('https://i.etsystatic.com/12601500/r/il/68d43a/2290444253/il_fullxfull.2290444253_pdtx.jpg'))),
        child: Column(
          children: [

            Container(child: Stack
             (children: [
                
                  BackdropFilter(
                   filter: ImageFilter.blur(
                     sigmaX: 5.0,
                     sigmaY: 5.0,
                   ),),
                 Container(
                   height: height*1,
                   width: width*1,
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                   gradient: LinearGradient(colors: [Colors.grey.withOpacity(1),Colors.white.withOpacity(0.4)],end: Alignment.bottomLeft,begin: Alignment.topRight)),
                   child: Column(
                    children: [
                      Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: height*0.75,
                        width: width*0.48,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only( bottom:15.0,left: 10.0),
                            child: Text('Welcome To Bag Store',textAlign: TextAlign.left,
                            style: TextStyle(color: Color.fromARGB(255, 52, 16, 116),fontSize: 40,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
                        ),

                        GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => Project2()));} ,
                          child: Container(
                            height: height*0.06,
                            width: width*0.4,
                            child: Card(color: Color.fromARGB(255, 108, 33, 247),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),),
                            child: Center(child: Text('Get Started',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 18),)),
                              
                              ),
                          ),
                        ),
                        SizedBox(height: 20,),

                        GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));} ,
                          child: Container(
                            height: height*0.06,
                            width: width*0.4,
                            child: Card(color: Color.fromARGB(255, 239, 241, 82),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),),
                            child: Center(child: Text('Create Account',textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontSize: 18))),
                              
                              ),
                          ),
                        )
                    ],
                   ))
                   ]
                   ))
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final String cartImage;
  final String cartName;
  final String cartPrice;
  int quantity;
  
  var name;

  CartItem({
    required this.cartImage,
    required this.cartName,
    required this.cartPrice,
    this.quantity = 1,
  });
}

class Project2 extends StatefulWidget {
  const Project2({super.key});

  @override
  State<Project2> createState() => _Project2State();
}

class _Project2State extends State<Project2> {
   bool isTap=false;
   bool search=false;
   List imagelist=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfhR-PnV3peNHWKQSCQWq-duYe4G0mWT9_Zmm4sgJn6_Fg42gSH2jWtV07Cx4PIJxsefU&usqp=CAU',
    'https://m.media-amazon.com/images/I/61YBwsstOFL._AC_SX342_.jpg',
    'https://5.imimg.com/data5/ANDROID/Default/2022/12/FX/GW/NR/33576657/product-jpeg-500x500.jpg',
    'https://zouk.co.in/cdn/shop/products/FalaknumaGreenflapbagfront_0001_Layer11.jpg?v=1674327916&width=1000',
    'https://lzd-img-global.slatic.net/g/p/43df51f98500951bc7c021f6abc795f3.jpg_960x960q80.jpg_.webp',
    'https://www.soosi.co.in/cdn/shop/products/WhatsApp_Image_2019-12-15_at_17.43.16_580x.jpg?v=1576413852',
    'https://cdn.vibecity.in/providers/6362311a17c98a00111b0052/IMG20230131124013340_8caa6d6a-12d1-4d17-8966-5b1ce1c525ef.jpg',
    'https://m.media-amazon.com/images/I/51jWPa0dQlS._AC_.jpg',];
  List namelist=['Shoulder Bag',
  'Combo Bag',
  'Sling Bag',
  'Side Bag',
  'Hand Bag',
  'Heart Bag',
  'Clutch',
  'Sling Bag'
    ];
  List pricelist=['₹1200',
  '₹800',
    '₹900',
    '₹700',
    '₹900',
    '₹1100',
    '₹600',
    '₹400'
    ];

  // List finallist=[
  //  {'image' :'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfhR-PnV3peNHWKQSCQWq-duYe4G0mWT9_Zmm4sgJn6_Fg42gSH2jWtV07Cx4PIJxsefU&usqp=CAU','name':'Shoulder Bag','price':'₹1200'},
  //  {'image' :'https://m.media-amazon.com/images/I/61YBwsstOFL._AC_SX342_.jpg','name':'Combo Bag','price':'₹800'},
  //  {'image' :'https://5.imimg.com/data5/ANDROID/Default/2022/12/FX/GW/NR/33576657/product-jpeg-500x500.jpg','name':'Sling Bag','price':'₹900'},
  //  {'image' :'https://zouk.co.in/cdn/shop/products/FalaknumaGreenflapbagfront_0001_Layer11.jpg?v=1674327916&width=1000','name':'Side Bag','price':'₹700'},
  //  {'image' :'https://lzd-img-global.slatic.net/g/p/43df51f98500951bc7c021f6abc795f3.jpg_960x960q80.jpg_.webp','name':'Hand Bag','price':'₹900'},
  //  {'image' :'https://www.soosi.co.in/cdn/shop/products/WhatsApp_Image_2019-12-15_at_17.43.16_580x.jpg?v=1576413852','name':'Heart Bag','price':'₹1100'},
  //  {'image' :'https://cdn.vibecity.in/providers/6362311a17c98a00111b0052/IMG20230131124013340_8caa6d6a-12d1-4d17-8966-5b1ce1c525ef.jpg','name':'Clutch','price':'₹600'},
  //  {'image' :'https://m.media-amazon.com/images/I/51jWPa0dQlS._AC_.jpg','name':'Sling Bag','price':'₹400'},
  // ];
  @override
  Widget build(BuildContext context) {
    var index=0;
    bool isItemInCart = false;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    //assert(imagelist.length == namelist.length && namelist.length == pricelist.length);

    
    TextEditingController _searchController = TextEditingController();
    var searchlist=[];
    void searchView(String keyword){

      var templist=[];
      for(var i in namelist){
        if (i.contains(keyword)){
          templist.add(i);
        }
        
      }
      
      searchlist=templist;
      print('search ${searchlist}');
      setState(() {
        
      });
    }

    List<CartItem> cartItems=[];
    // var image;
    // var name;
    // var price;
    var count=0;
    void displayCartItem(){
        cartItems.forEach((element) {print("item =${element.cartName}");});
      }
      void addToCart() {
         print("items are added ${imagelist[index]},${namelist[index]},${pricelist}");
        setState(() {
          isItemInCart = true;
          
          CartItem product = CartItem(
            cartImage:imagelist[index], 
            cartName: namelist[index], 
            cartPrice: pricelist[index],
            quantity: count);
         
        //print("items are added");
        cartItems.add(product);
        print("is cart item=${isItemInCart}");

         displayCartItem();

        //print('new:${cartItems}');

        //totalitem+=1;
          // cartName.add('${widget.name}');
          // cartImage.add('${widget.image}');
          // cartPrice.add('${widget.price}');
          // cartQuantity.add(count);

          // print('new :${cartName}');
          // print('new :${cartImage}');
        });
      }

      void removeFromCart() {
        print("removed index ${index}");
        if (isItemInCart) {
          setState(() {
            isItemInCart = false;
            // CartItem product = CartItem(
            // cartImage:image[index], 
            // cartName: name[index], 
            // cartPrice: price[index],
            // quantity: count);
         

        //cartItems.removeAt(index);
        cartItems.clear();
            // cartName.removeAt(index);
            // cartImage.remove(index);
            // cartPrice.removeAt(index);
            // cartQuantity.removeAt(index);
          });
        }
      }

      void toggle(){
        if (!isItemInCart) {
          addToCart();

        } 
        else {
          removeFromCart();
        }
      }

      

      void increment() {
        setState(() {
          count++;
        });
      }

      void decrement() {
        if (count > 1) {
          setState(() {
            count--;
          });
        }
      }



    Widget makeSCard (String image, String name, String price,index){
      return GestureDetector(
        onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedPage(name: namelist[index],image:imagelist[index],price:pricelist[index],toggle:(){toggle();},increment: (){increment();},decrement: (){decrement();},)));} ,
        child: Card(          
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  right: 8,
                  left: 8
                ),
                child: Stack(
                  children: [
                  Container(
                    height: height*0.176,
                    width: width*0.43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                            image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(image))),
                  ),
      
                  Positioned(
                    bottom: 104,
                    left: 125,
                    child: IconButton(onPressed: (){}, 
                    icon: Icon(Icons.favorite_border)),
                  )
                ],
                   
                ),
              ),
              Container(
                height: height*0.072,
                width: width*0.4,
                child:ListTile(
                  title: Text(name),
                  subtitle: Text(price),
                )
              )
            ],
          ),
        ),
      );
    }
    Widget makeCard (n){
      return Container(
         height: height*0.28,
        width: width*1,
        decoration: BoxDecoration(color:  Color.fromARGB(255, 235, 236, 147)),
          child: Row(children: [
           makeSCard(imagelist[n], namelist[n], pricelist[n],n),
           makeSCard(imagelist[n+1], namelist[n+1], pricelist[n+1],n+1),
            
          ]));
    }

    Widget make2ndCard (String image, String name, String price, index){
      return GestureDetector(
        onTap:(){print('new ${index}');
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedPage(name:namelist[index],image:imagelist[index],price:pricelist[index],toggle:(){toggle();},increment: (){increment();},decrement: (){decrement();},)));} ,
        child: Card(        
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  right: 8,
                  left: 8
                ),
                child: Stack(
                  children: [
                  Container(
                    height: height*0.18,
                    width: width*0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                            image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(image))),
                  ),
      
                  Positioned(
                    bottom: 104,
                    left: 300,
                    child: IconButton(onPressed: (){}, 
                    icon: Icon(Icons.favorite_border)),
                  )
                ],
                   
                ),
              ),
              Container(
                height: height*0.07,
                width: width*0.8,
                child:ListTile(
                  title: Text(name),
                  subtitle: Text(price),
                )
              )
            ],
          ),
        ),
      );
    }

    Widget searchCard (index){
      return Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                right: 8,
                left: 10
              ),
              child: Container(
                height: height*0.15,
                width: width*0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                        image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(imagelist[index]))),
              ),
            ),
            Container(
              height: height*0.1,
              width: width*0.4,
              child:ListTile(
                title: Text(namelist[index]),
                subtitle: Text(pricelist[index]),
              )
            )
          ],
        ),
      );
    }

    Widget searchBar(){
      return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search product here',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _searchController.clear(),
                      ),
                      
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                       
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),));
    }

    Widget show1stCard(){
      return Container(
        child: Column(
          children: [
            makeCard(0),
            makeCard(2),                
            makeCard(4),                       
            makeCard(6),
          ],
        ),
      );
      
    }

    Widget show2ndCard(){
      return Container(
        child: Column(
          children: [
            make2ndCard(imagelist[0], namelist[1], pricelist[0],0),
            make2ndCard(imagelist[1], namelist[1], pricelist[1],1),
            make2ndCard(imagelist[2], namelist[2], pricelist[2],2),
            make2ndCard(imagelist[3], namelist[3], pricelist[3],3),
            make2ndCard(imagelist[4], namelist[4], pricelist[4],4),
            make2ndCard(imagelist[5], namelist[5], pricelist[5],5),
            make2ndCard(imagelist[6], namelist[6], pricelist[6],6),
            make2ndCard(imagelist[7], namelist[7], pricelist[7],7),
          ],
        ),
      );
      
    }
    
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Color.fromARGB(255, 234, 247, 51),
        centerTitle: true,
        title: Text('Bag Store',style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 40),),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:2.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromARGB(255, 235, 236, 147)),
            child: Column(
              children: [
                searchBar(),
          
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isTap=!isTap;
                    });
                  },
                  child: ListTile(trailing: Icon(isTap ?Icons.hive_rounded:Icons.grid_on_rounded),)),
        
                search?searchCard(index):
                isTap?show2ndCard():show1stCard(),
                
                
              ],
            ),
          ),
        )),
    );
  }
}


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   bool password= true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    void PasswordVisibility() {
      password = !password;
    setState(() {
      
    });
  }
    return Scaffold(
      body: Center(
        child: Container(
          height: height*1,
          width: width*1,
          decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: NetworkImage('https://www.shutterstock.com/shutterstock/photos/1966878925/display_1500/stock-vector-ladies-handbag-set-of-fashion-accessories-seamless-vector-pattern-background-cartoon-print-1966878925.jpg'))),
          child: Column(
            children: [
              Container(height: height*0.3,
                width: width*0.3,),
              
                Container(child: Stack
             (children: [
                
                  BackdropFilter(
                   filter: ImageFilter.blur(
                     sigmaX: 5.0,
                     sigmaY: 5.0,
                   ),),
                 Container(
                   height: height*0.34,
                   width: width*0.8,
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                   gradient: LinearGradient(colors: [Colors.grey.withOpacity(1),Colors.grey.withOpacity(0.4)],end: Alignment.bottomLeft,begin: Alignment.topRight)),
                   child: Column(
                    children: [
                      Container(
                        width:width*0.75 ,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                top: 18,
                                bottom: 10,
                              ),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),),
                                child: Container(
                                  height: height*0.07,
                                  width: width*0.8,
                                  decoration: BoxDecoration(color: Colors.blue[100],borderRadius: BorderRadius.circular(20)),
                                  child: TextField(
                                    decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.people),
                                    hintText: 'Enter Name',
                                    hintStyle: TextStyle(fontFamily: 'Schyler',color: Colors.black),
                                    border: InputBorder.none,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                      color: const Color.fromARGB(255, 96, 178, 245),  
                                      width: 3.0,           
                                    ),  
                                    borderRadius: BorderRadius.circular(20.0) )
                                )
                                  ),
                              )),
                            ),
                        ),

                        SizedBox(height: 10,),
                
                        Container(
                          width:width*0.75 ,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 2,
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),),
                              child: Container(
                                height: height*0.07,
                                width: width*0.8,
                                decoration: BoxDecoration(color: Colors.blue[100],borderRadius: BorderRadius.circular(20)),
                                child: TextField(
                                  obscureText: password,
                                  decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.password),
                                  hintText: 'Enter Password',
                                  hintStyle: TextStyle(fontFamily: 'Schyler',color: Colors.black),
                                  border: InputBorder.none,
                        
                                  suffixIcon: Container(child: IconButton(onPressed: (){PasswordVisibility();},
                                    icon:Icon(password ? (Icons.remove_red_eye_rounded):(Icons.remove_red_eye_outlined)))),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                    color: const Color.fromARGB(255, 96, 178, 245),  
                                    width: 3.0,           
                                  ),
                                  borderRadius: BorderRadius.circular(20.0) )
                              )
                                ),
                            )),
                          ),
                        ),

                        SizedBox(height: 30,),
                        
                        GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => Project2()));} ,
                          child: Container(
                                      height: height*0.06,
                                      width: width*0.25,
                                      child: Card(color: Color.fromARGB(255, 240, 140, 215),
                                        shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),),
                                      child: Center(child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                                        
                                        ),
                                    ),)
                    ],
                   ))
                   ]
                   )
                   )
            ]),
       
        ),

      ),
    );
  }
}




class DetailedPage extends StatefulWidget {
  var image;
  var name;
  var price;
  VoidCallback toggle;
  VoidCallback increment;
  VoidCallback decrement;
  DetailedPage({super.key, required this. image, required this. name, required this. price,required this.toggle, required this.decrement,required this.increment  });

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  bool isItemInCart = false;
  int count = 1;
  
  var  index =0;
  int totalitem=0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //  List cartName = [];
    //  List cartImage=[];
    //  List cartPrice=[];
    //  List cartQuantity=[];

    // List<CartItem> cartItems=[];
    // // var image;
    // // var name;
    // // var price;
    // void displayCartItem(){
    //     cartItems.forEach((element) {print("item =${element.cartName}");});
    //   }
    //   void addToCart() {
    //      print("items are added ${widget.image[index]},${widget.name[index]},${widget.price}");
    //     setState(() {
    //       isItemInCart = true;
          
    //       CartItem product = CartItem(
    //         cartImage:widget.image, 
    //         cartName: widget.name, 
    //         cartPrice: widget.price,
    //         quantity: count);
         
    //     //print("items are added");
    //     cartItems.add(product);
    //     print("is cart item=${isItemInCart}");

    //      displayCartItem();

    //     //print('new:${cartItems}');

    //     //totalitem+=1;
    //       // cartName.add('${widget.name}');
    //       // cartImage.add('${widget.image}');
    //       // cartPrice.add('${widget.price}');
    //       // cartQuantity.add(count);

    //       // print('new :${cartName}');
    //       // print('new :${cartImage}');
    //     });
    //   }

    //   void removeFromCart() {
    //     print("removed index ${index}");
    //     if (isItemInCart) {
    //       setState(() {
    //         isItemInCart = false;
    //         // CartItem product = CartItem(
    //         // cartImage:image[index], 
    //         // cartName: name[index], 
    //         // cartPrice: price[index],
    //         // quantity: count);
         

    //     //cartItems.removeAt(index);
    //     cartItems.clear();
    //         // cartName.removeAt(index);
    //         // cartImage.remove(index);
    //         // cartPrice.removeAt(index);
    //         // cartQuantity.removeAt(index);
    //       });
    //     }
    //   }

      
     
//       void toggle(int index) {
//   setState(() {
//     var imagelist;
//     var namelist;
//     var pricelist;
//     final product = CartItem(
//       cartImage: imagelist[index],
//       cartName: namelist[index],
//       cartPrice: pricelist[index],
//     );

//     final existingItem = cartItems.firstWhere(
//       (item) => item.name == product.name,
//       //orElse: () => null,
//     );

//     if (existingItem != null) {
//       existingItem.quantity++;
//     } else {
//       cartItems.add(product);
//     }
//   });
// }


      // void toggle(){
      //   if (!isItemInCart) {
      //     addToCart();

      //   } 
      //   else {
      //     removeFromCart();
      //   }
      // }

      

      // void increment() {
      //   setState(() {
      //     count++;
      //   });
      // }

      // void decrement() {
      //   if (count > 1) {
      //     setState(() {
      //       count--;
      //     });
      //   }
      // }


    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
      
      centerTitle: true,
      title:Text ('${widget.name}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 34),),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right:14.0),
          child: GestureDetector(onTap:(){
           
          //   Navigator.push(context, MaterialPageRoute
          // (builder: (context) => Cart(
          //   //cartImage:cartImage,cartName:cartName,cartPrice:cartPrice,cartQuantity:cartQuantity
          //   )));
          } ,
            child: Stack(children: [
              IconButton(onPressed: (){
                //toggle();
                //displayCartItem();
              }, icon: Icon(isItemInCart ? Icons.shopping_cart: Icons.shopping_cart_outlined,color: Colors.white,) ),
              Positioned(
            top: 0,
            right: 0,
            
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 11.0,
              child: Align(alignment: Alignment.center,child: Text(isItemInCart ?'1':'0',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),))))
              
              ] ),
          ),
        )
      ],
      ),
      body: Container(
        height: height*1,
        width: width*1,
        decoration: BoxDecoration(color: Colors.blue[50]),
        child: Column(children: [
          

          Stack(
            children:[ Container(
              height: height*0.38,
              width: width*1,
              decoration: BoxDecoration(color: Colors.blue,
              gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple], 
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter, 
            ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)
              )),
            ),

            Center(
              child: Container(
                height: height*0.3,
                width: width*0.75,
                decoration: BoxDecoration(color: Colors.amber,
                image: DecorationImage(image: NetworkImage('${widget.image}'),fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)
                ),),
            ),
        ]),
      
          Container(
            height: height*0.06,
            width: width*1,
            child: ListTile(
              leading: Text('${widget.price}',style: TextStyle(fontSize: 25),),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined)),
            ),
          ),

          Container(
            height: height*0.05,
            width: width*1,

            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Product Details',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue[900])),
            )
          ),
      
          Container(
            height: height*0.25,
            width: width*1,
            //decoration: BoxDecoration(color: Colors.amber),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('This leather bag is a timeless and elegant accessory, meticulously crafted from high-quality, full-grain leather. Its classic design features a spacious main compartment, perfect for daily essentials, and multiple interior pockets for organization. The durable construction and adjustable shoulder strap make it a versatile and stylish choice for any occasion. Elevate your style with this luxurious leather bag that combines sophistication and functionality.',
              style: TextStyle(fontSize: 15,color: Colors.blueGrey[800]),),
            ),
          ),

          Container(
            height: height*0.05,
            width: width*1,

            child:Padding(
              padding: const EdgeInsets.only(left: 66,top: 10),
              child: Text('Quantity',style: TextStyle(fontSize: 22,color: Colors.blue[900])),
            )
          ),
      
          Container(
            height: height*0.1,
            width: width*1,
            child:Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 9,
                      right: 9,
                      top: 9),
                  child: Container(
                    width: width*0.5,
                    height:height* 0.1,
                    
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                          height:height* 0.1,
                          width: width*0.17,
                          child: ElevatedButton(
                            onPressed:widget. decrement,
                            child: Text('-',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                            style: ElevatedButton.styleFrom(    
                            shape: RoundedRectangleBorder(      
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10)
                              ),    
                              ),    
                              backgroundColor: Colors.purple[400],  ),
                          ),
                        ),
                        
                        Container(
                          width: width*0.16,
                          child: Center(
                            child: Text(
                              '$count',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                        
                        Container(
                          height:height* 0.1,
                          width: width*0.17,
                          child: ElevatedButton(
                            onPressed: widget. increment,
                            child: Text('+',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white)),
                            style: ElevatedButton.styleFrom(    
                            shape: RoundedRectangleBorder(      
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10)
                              ),    
                              ),    
                              backgroundColor: Colors.purple[400],  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width*0.42,
                  height:height* 0.1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 2,
                      top: 8),
                    child: ElevatedButton(onPressed: (){
                      widget.toggle();
                    }, 
                    child: Text(isItemInCart ? 'Remove from Cart' :'Add To Cart',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20),),
                    style: ElevatedButton.styleFrom(    
                            shape: RoundedRectangleBorder(      
                              borderRadius: BorderRadius.circular(10),    
                              ),    
                              backgroundColor: Colors.purple[400],  ),),
                  ),
                  )
              ]),
            ),
        ]),
      ),

    );
  }
}

class Cart extends StatefulWidget {
  // var cartImage;
  // var cartName;
  // var cartPrice;
  // var cartQuantity;
  Cart({super.key, 
  //required this. cartImage, required this.cartName, required this. cartPrice, required this. cartQuantity
  });

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  Widget smallCard(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          height: height*0.12,
          width: width*0.95,
          // child: ListTile(
          //   leading:Container() ,
          //   title: Text('vksms'),
          //   subtitle: Text('ffokfo'),
          //   trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
      
          // ),
          child: Row(
            children: [
              SizedBox(width: 10,),
              //image
              Container(
                height: height*0.1,
                width: width*0.3,
                decoration: BoxDecoration(image: DecorationImage(image:NetworkImage(''
                  //'${widget.cartImage}'
                  ),fit: BoxFit.cover )),
              ),
              SizedBox(width: 15,),
              //name price quantity
              Container(
                height: height*0.1,
                width: width*0.4,
                decoration: BoxDecoration(color: Colors.amber),
                child: Column(
                  children: [
                    // Text('${widget.cartName}'),
                    // Text('${widget.cartPrice}'),
                    // Text('${widget.cartQuantity}')
                  ],
                ),
              ),
              //icon
              SizedBox(width:10,),
              Container(
                height: height*0.1,
                width: width*0.12,
                decoration: BoxDecoration(color: Colors.blue),
                child: Center(
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                ),
              ),
            ]),
        ),
      ),
    );
  }

    return Scaffold(
      body: Column(
        children: [
          Container(height: height*0.1,),
          smallCard()
        ],
      ),
    );
  }
}