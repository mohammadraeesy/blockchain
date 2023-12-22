import 'package:uni_project/feature/home/domain/entities/home_entity.dart';

class CoinEntityModel extends CoinEntity {
  CoinEntityModel({
    String? id,
    String? symbol,
    String? name,
    String? image,
    double? currentPrice,
    int? marketCap,
    int? marketCapRank,
    int? fullyDilutedValuation,
    int? totalVolume,
    double? high24h,
    double? low24h,
    double? priceChange24h,
    double? priceChangePercentage24h,
    double? marketCapChange24h,
    double? marketCapChangePercentage24h,
    double? circulatingSupply,
    double? totalSupply,
    double? maxSupply,
    double? ath,
    double? athChangePercentage,
    String? athDate,
    double? atl,
    double? atlChangePercentage,
    String? atlDate,
    String? lastUpdated,
    SparklineIn7d? sparklineIn7d,
  }) : super(
          id: id,
          name: name,
          image: image,
          ath: ath,
          athChangePercentage: athChangePercentage,
          athDate: athDate,
          atl: atl,
          atlDate: atlDate,
          atlChangePercentage: athChangePercentage,
          circulatingSupply: circulatingSupply,
          currentPrice: currentPrice,
          fullyDilutedValuation: fullyDilutedValuation,
          high24h: high24h,
          lastUpdated: lastUpdated,
          low24h: low24h,
          marketCap: marketCap,
          marketCapChange24h: marketCapChange24h,
          marketCapChangePercentage24h: marketCapChangePercentage24h,
          marketCapRank: marketCapRank,
          maxSupply: maxSupply,
          priceChange24h: priceChange24h,
          priceChangePercentage24h: priceChangePercentage24h,
          symbol: symbol,
          sparklineIn7d: sparklineIn7d,
          totalSupply: totalSupply,
          totalVolume: totalVolume,
        );

  factory CoinEntityModel.fromJson(Map<String, dynamic> json) =>
      CoinEntityModel(
        id: json['id'],
        symbol: json['symbol'],
        name: json['name'],
        image: json['image'],
        currentPrice: json['current_price'].toDouble(),
        marketCap: json['market_cap'],
        marketCapRank: json['market_cap_rank'],
        fullyDilutedValuation: json['fully_diluted_valuation'],
        totalVolume: json['total_volume'],
        high24h: json['high_24h'].toDouble(),
        low24h: json['low_24h'].toDouble(),
        priceChange24h: json['price_change_24h'],
        priceChangePercentage24h: json['price_change_percentage_24h'],
        marketCapChange24h: json['market_cap_change_24h'].toDouble(),
        marketCapChangePercentage24h: json['market_cap_change_percentage_24h'],
        circulatingSupply: json['circulating_supply'],
        totalSupply: json['total_supply'],
        maxSupply: json['max_supply'],
        ath: json['ath'].toDouble(),
        athChangePercentage: json['ath_change_percentage'],
        athDate: json['ath_date'],
        atl: json['atl'],
        atlChangePercentage: json['atl_change_percentage'],
        atlDate: json['atl_date'],
        lastUpdated: json['last_updated'],
        sparklineIn7d: json['sparkline_in_7d'] != null
            ? SparklineIn7dModel.fromJson(json['sparkline_in_7d'])
            : null,
      );
}

class SparklineIn7dModel extends SparklineIn7d {
  SparklineIn7dModel({List<double>? price}) : super(price: price);

  factory SparklineIn7dModel.fromJson(Map<String, dynamic> json) {
    return SparklineIn7dModel(
      price: json['price'].cast<double>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    return data;
  }
}
