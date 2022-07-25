// To parse this JSON data, do
//
//     final bitcoinModel = bitcoinModelFromJson(jsonString);

import 'dart:convert';

BitcoinModel bitcoinModelFromJson(String str) => BitcoinModel.fromJson(json.decode(str));

String bitcoinModelToJson(BitcoinModel data) => json.encode(data.toJson());

class BitcoinModel {
    BitcoinModel({
        this.time,
        this.disclaimer,
        this.chartName,
        this.bpi,
    });

    Time? time;
    String? disclaimer;
    String? chartName;
    Bpi? bpi;

    factory BitcoinModel.fromJson(Map<String, dynamic> json) => BitcoinModel(
        time: Time.fromJson(json["time"]),
        disclaimer: json["disclaimer"],
        chartName: json["chartName"],
        bpi: Bpi.fromJson(json["bpi"]),
    );

    Map<String, dynamic> toJson() => {
        "time": time!.toJson(),
        "disclaimer": disclaimer,
        "chartName": chartName,
        "bpi": bpi!.toJson(),
    };
}

class Bpi {
    Bpi({
        this.usd,
        this.gbp,
        this.eur,
    });

    Eur? usd;
    Eur? gbp;
    Eur? eur;

    factory Bpi.fromJson(Map<String, dynamic> json) => Bpi(
        usd: Eur.fromJson(json["USD"]),
        gbp: Eur.fromJson(json["GBP"]),
        eur: Eur.fromJson(json["EUR"]),
    );

    Map<String, dynamic> toJson() => {
        "USD": usd!.toJson(),
        "GBP": gbp!.toJson(),
        "EUR": eur!.toJson(),
    };
}

class Eur {
    Eur({
        this.code,
        this.symbol,
        this.rate,
        this.description,
        this.rateFloat,
    });

    String? code;
    String? symbol;
    String? rate;
    String? description;
    double? rateFloat;

    factory Eur.fromJson(Map<String, dynamic> json) => Eur(
        code: json["code"],
        symbol: json["symbol"],
        rate: json["rate"],
        description: json["description"],
        rateFloat: json["rate_float"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "symbol": symbol,
        "rate": rate,
        "description": description,
        "rate_float": rateFloat,
    };
}

class Time {
    Time({
        this.updated,
        this.updatedIso,
        this.updateduk,
    });

    String? updated;
    DateTime? updatedIso;
    String? updateduk;

    factory Time.fromJson(Map<String, dynamic> json) => Time(
        updated: json["updated"],
        updatedIso: DateTime.parse(json["updatedISO"]),
        updateduk: json["updateduk"],
    );

    Map<String, dynamic> toJson() => {
        "updated": updated,
        "updatedISO": updatedIso!.toIso8601String(),
        "updateduk": updateduk,
    };
}
