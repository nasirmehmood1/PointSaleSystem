import 'package:flutter/material.dart';
import 'package:flutter_point_sale_system_ui/item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  // String productName='';
  // var productPrice='';
  // var productQuantity='';
  late TextEditingController _controllerName;
  late TextEditingController _controllerQuantity;
  late TextEditingController _controllerPrice;
  final List<Item> itemList = [];

  @override
  void initState() {
    super.initState();
   _controllerName=TextEditingController();
   _controllerQuantity=TextEditingController();
   _controllerPrice=TextEditingController();

  }
  @override
  void dispose() {
    _controllerName.dispose();
    _controllerQuantity.dispose();
    _controllerPrice.dispose();
    super.dispose();
  }
    

  void totalPriceOfProduct(){
   setState(() {
    itemList.add(Item(itemName: _controllerName.text, price: double.parse(_controllerPrice.text), quantity: int.parse(_controllerQuantity.text)));
    // productName=_controllerName.text;
    // productPrice=_controllerPrice.text;
    // productQuantity=_controllerQuantity.text;
   });

  }
  bool isFast=true;
  final formKey=GlobalKey<FormState>();
  FocusNode productIdFocusNode=FocusNode();
  FocusNode productNameFocusNode=FocusNode();
  FocusNode dateFocusNode=FocusNode();
  FocusNode descriptionFocusNode=FocusNode();
  FocusNode priceFocusNode=FocusNode();
  FocusNode quantityFocusNode=FocusNode();
  FocusNode paymentMethodFocusNode=FocusNode();
  FocusNode customerNameFocusNode=FocusNode();
  FocusNode btnSaveFocusNode=FocusNode();
  FocusNode btnUpdateFocusNode=FocusNode();
  FocusNode btnClearFocusNode=FocusNode();



  void fastEntrY(){
   if (isFast) {
    btnUpdateFocusNode.skipTraversal=isFast;
    btnClearFocusNode.skipTraversal=isFast;
    isFast=!isFast;     
   } else {
     
   }
  }

  void _validate(){
    formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          width: width * 0.2,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(color: Colors.black12, offset: Offset(-3, -3))
                  ]),
                  child: Image(
                    image: AssetImage('assests/image/pos.png'),
                    fit: BoxFit.cover,
                  )),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.home_outlined),
                ),
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.filter_list_sharp),
                ),
                title: Text(
                  'Catagory list',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.format_list_numbered_outlined),
                ),
                title: Text(
                  'Product list',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.calendar_today_outlined),
                ),
                title: Text(
                  'POS',
                  style: TextStyle(fontSize: 13),
                ),
              )
            ],
          ),
        ),
        body: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.2,
                  child: const Text(
                    'point of sales:',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    SizedBox(
                      height: height * 0.05,
                      width: width * 0.3,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isNumberString() && value!.isNotEmpty) {
                            return null;
                          } else {
                            return 'invalid number';
                          }
                        },
                        focusNode: productIdFocusNode,
                        autofocus: true,
                        cursorHeight: 15,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.green.shade50,
                            labelText: 'Product Id',
                            icon:const Icon(Icons.pin_rounded),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(width * 0.01)))),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    SizedBox(
                      height: height * 0.05,
                      width: width * 0.15,
                      child: TextFormField(
                         focusNode: dateFocusNode,
          
                        cursorHeight: 15,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.green.shade50,
                            labelText: 'Today date',
                            icon: Icon(Icons.date_range_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(width * 0.01)))),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    SizedBox(
                      height: height * 0.05,
                      width: width * 0.3,
                      child: TextFormField(
                        controller: _controllerName,
                        focusNode: productNameFocusNode,
                        cursorHeight: 15,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.green.shade50,
                            labelText: 'Product name',
                            icon: const Icon(Icons.drive_file_rename_outline),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(width * 0.01)))),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    SizedBox(
                      height: height * 0.05,
                      width: width * 0.3,
                      child: TextFormField(
                        focusNode: descriptionFocusNode,
                        cursorHeight: 15,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.green.shade50,
                            labelText: 'Description',
                            icon: const Icon(Icons.description_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(width * 0.01)))),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    SizedBox(
                      height: height * 0.05,
                      width: width * 0.2,
                      child: TextFormField(
                        controller: _controllerPrice,
                         validator: (value) {
                          if (value.isNumberString() && value!.isNotEmpty) {
                            return null;
                          } else {
                            return 'invalid price';
                          }
                        },
                        focusNode: priceFocusNode,
                        cursorHeight: 15,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.green.shade50,
                            labelText: 'Price',
                            icon: const Icon(Icons.price_check),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(width * 0.01)))),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.2,
                    ),
                    SizedBox(
                      height: height * 0.05,
                      width: width * 0.2,
                      child: TextFormField(
                        controller: _controllerQuantity,
                        focusNode: quantityFocusNode,
                        cursorHeight: 15,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.green.shade50,
                            labelText: 'Quantity',
                            icon: const Icon(Icons.production_quantity_limits),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(width * 0.01)))),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    SizedBox(
                      height: height * 0.05,
                      width: width * 0.3,
                      child: TextFormField(
                        focusNode: paymentMethodFocusNode,
                        cursorHeight: 15,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.green.shade50,
                            labelText: 'Payment Method',
                            icon: const Icon(Icons.paypal),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(width * 0.01)))),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    SizedBox(
                      height: height * 0.05,
                      
                      width: width * 0.3,
                      child: TextFormField(
                        focusNode: customerNameFocusNode,
                        cursorHeight: 15,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.green.shade50,
                            labelText: 'Customer name',
                            icon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(width * 0.01)))),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.4,
                    ),
                    const Text(
                      'Sales Amount :',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(width: width*0.1,),
                    ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(focusNode: btnSaveFocusNode,onPressed: totalPriceOfProduct, child: const Text('save'),),
                  ElevatedButton(focusNode: btnUpdateFocusNode,onPressed: fastEntrY, child: const Text('update')),
                  ElevatedButton(focusNode: btnClearFocusNode,onPressed: () {}, child: const Text('Clear')),
                ],
              ),
              SizedBox(width: width*0.15,),
                    Container(
                      width: width * 0.4,
                      height: height * 0.3,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(width * 0.009)),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          )),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: height*0.03,),
                          Row(
                            children: [
                            const Padding(padding: EdgeInsets.all(10)),
                            const SizedBox(child: Text('Sr No:',style: TextStyle(fontWeight: FontWeight.bold),)),
                            SizedBox(width: width*0.01,),
                             const SizedBox(child: Text('Product name',style: TextStyle(fontWeight: FontWeight.bold),)),
                              SizedBox(
                                width: width * 0.05,
                              ),
                              const SizedBox(
                                child: Text('Quantity',style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                width: width * 0.1,
                              ),
                              const SizedBox(
                                child: Text('Price',style: TextStyle(fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                          
                          SizedBox(height: height*0.01,),
                          for(var i = 0 ; i < itemList.length ; i++)
                          Container(
                            color: Colors.green.shade50,
                            child: Row(
                                  children: [
                                  const Padding(padding: EdgeInsets.all(10)),
                                  const SizedBox(child: Text('1',style: TextStyle(fontWeight: FontWeight.bold),)),
                                  SizedBox(width: width*0.05,),
                                    SizedBox(child: Text(itemList[i].itemName,style:const TextStyle(fontWeight: FontWeight.bold),)),
                                    SizedBox(
                                      width: width * 0.09,
                                    ),
                                     SizedBox(
                                      child: Text(itemList[i].quantity.toString(),style:const TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                    SizedBox(
                                      width: width * 0.11,
                                    ),
                                     SizedBox(
                                      child: Text(itemList[i].price.toString(),style: const TextStyle(fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                            ),
                        ],
                      ),
                    ),
                   
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 
 extension Modification on String?{
  bool isNumberString(){
    return this ?.codeUnits.every((element) => element >=48 && element <=57)?? false;
  }
 }
