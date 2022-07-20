class KurModel {
  List<TCMBAnlikKurBilgileri>? tCMBAnlikKurBilgileri;

  KurModel({this.tCMBAnlikKurBilgileri});

  KurModel.fromJson(Map<String, dynamic> json) {
    if (json['TCMB_AnlikKurBilgileri'] != null) {
      tCMBAnlikKurBilgileri = <TCMBAnlikKurBilgileri>[];
      json['TCMB_AnlikKurBilgileri'].forEach((v) {
        tCMBAnlikKurBilgileri!.add(TCMBAnlikKurBilgileri.fromJson(v));
      });
    }
  }
}

class TCMBAnlikKurBilgileri {
  String? isim;
  String? currencyName;
  dynamic forexBuying;
  dynamic forexSelling;
  dynamic banknoteBuying;
  dynamic banknoteSelling;
  dynamic crossRateUSD;
  dynamic crossRateOther;

  TCMBAnlikKurBilgileri(
      {this.isim,
      this.currencyName,
      this.forexBuying,
      this.forexSelling,
      this.banknoteBuying,
      this.banknoteSelling,
      this.crossRateUSD,
      this.crossRateOther});

  TCMBAnlikKurBilgileri.fromJson(Map<String, dynamic> json) {
    isim = (json['Isim'] as String).replaceAll('İ', 'i');
    currencyName = (json['CurrencyName'] as String).toUpperCase();
    forexBuying = (json['ForexBuying']);
    forexSelling = json['ForexSelling'];
    banknoteBuying = json['BanknoteBuying'];
    banknoteSelling = json['BanknoteSelling'];
    crossRateUSD = json['CrossRateUSD'];
    crossRateOther = json['CrossRateOther'];
  }
}
