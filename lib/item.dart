class Item {
  String itemName;
  int quantity;
  double price;
  double totalPrice = 0;

  Item({required this.itemName , required this.price , required this.quantity ,});
  
  void calculate(){
    totalPrice = quantity * price;
  }
}