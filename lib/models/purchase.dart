class Purchase {
  int id;
  double atPrice;
  double amount;
  String name;

  Purchase({this.id, this.amount, this.atPrice, this.name});

  Map<String, dynamic> toMap() =>
      {"id": id, "name": name, "amount": amount, "atPrice": atPrice};

  factory Purchase.fromMap(Map<String, dynamic> json) => new Purchase(
      id: json["id"],
      name: json["name"],
      atPrice: json["atPrice"],
      amount: json["amount"]);
}
