
final list =  {
  "id": 69,
  "Code": "840",
  "Ccy": "USD",
  "CcyNm_RU": "Доллар США",
  "CcyNm_UZ": "AQSH dollari",
  "CcyNm_UZc": "АҚШ доллари",
  "CcyNm_EN": "US Dollar",
  "Nominal": "1",
  "Rate": "11600.17",
  "Diff": "0.03",
  "Date": "31.07.2023"
};


class Valyuta{
 int id;
 String code;
 String ccy;
 String ccyNmRU;
 String ccyNmUZ;
 String ccyNmUZc;
 String ccyNmEN;
 String nominal;
 String rate;
 String diff;
 String date;

 Valyuta({
      required this.id,
      required this.code,
      required this.ccy,
      required this.ccyNmRU,
      required this.ccyNmUZ,
      required this.ccyNmUZc,
      required this.ccyNmEN,
      required this.nominal,
      required this.rate,
      required this.diff,
      required this.date});


 factory Valyuta.fromJson(Map<String, Object?> json) => Valyuta(
   id: json["id"] as int,
   code: json["Code"] as String,
   ccy: json["Ccy"] as String,
   ccyNmRU: json["CcyNm_RU"] as String,
   ccyNmUZ: json["CcyNm_UZ"] as String,
   ccyNmUZc: json["CcyNm_UZC"] as String,
   ccyNmEN: json["CcyNm_EN"] as String,
   nominal: json["Nominal"] as String,
   rate: json["Rate"] as String,
   diff: json["Diff"] as String,
   date: json["Date"] as String,
 );

 @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Valyuta &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          code == other.code &&
          ccy == other.ccy &&
          ccyNmRU == other.ccyNmRU &&
          ccyNmUZ == other.ccyNmUZ &&
          ccyNmUZc == other.ccyNmUZc &&
          ccyNmEN == other.ccyNmEN &&
          nominal == other.nominal &&
          rate == other.rate &&
          diff == other.diff &&
          date == other.date;

  @override
  int get hashCode =>
      id.hashCode ^
      code.hashCode ^
      ccy.hashCode ^
      ccyNmRU.hashCode ^
      ccyNmUZ.hashCode ^
      ccyNmUZc.hashCode ^
      ccyNmEN.hashCode ^
      nominal.hashCode ^
      rate.hashCode ^
      diff.hashCode ^
      date.hashCode;

 @override
  String toString() {
    return 'Valyuta{id: $id, code: $code, ccy: $ccy, ccyNmRU: $ccyNmRU, ccyNmUZ: $ccyNmUZ, ccyNmUZc: $ccyNmUZc, ccyNmEN: $ccyNmEN, nominal: $nominal, rate: $rate, diff: $diff, date: $date}';
 }
}