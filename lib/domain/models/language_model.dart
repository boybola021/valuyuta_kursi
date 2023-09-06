class LanguageModel {
  String valyutaConvertor;
  String description;
  String amount;
  String amountConvert;
  String valyutaRate;

  LanguageModel(
      {
      required this.valyutaConvertor,
      required this.description,
      required this.amount,
      required this.amountConvert,
      required this.valyutaRate});

  factory LanguageModel.fromJson(Map<String,Object?> json){
    return LanguageModel(
        valyutaConvertor: json["valyutaConvertor"] as String,
        description: json["description"] as String,
        amount: json["amount"] as String,
        amountConvert: json["amountConvert"] as String,
        valyutaRate: json["valyutaRate"] as String,
    );
  }
  Map<String,Object?> toJson() => {
   "valyutaConvertor" : valyutaConvertor,
   "description" : description,
   "amount" : amount,
   "amountConvert" : amountConvert,
   "valyutaRate" : valyutaRate,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageModel &&
          runtimeType == other.runtimeType &&
          valyutaConvertor == other.valyutaConvertor &&
          description == other.description &&
          amount == other.amount &&
          amountConvert == other.amountConvert &&
          valyutaRate == other.valyutaRate;

  @override
  int get hashCode => Object.hash(
      valyutaConvertor.hashCode ,
      description.hashCode ,
      amount.hashCode,
      amountConvert.hashCode,
      valyutaRate.hashCode
  );

  @override
  String toString() {
    return 'LanguageModel{ valyutaConvertor: $valyutaConvertor, description: $description, amount: $amount, amountConvert: $amountConvert, valyutaRate: $valyutaRate}';
  }
}
