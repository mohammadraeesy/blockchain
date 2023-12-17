import 'package:flutter/material.dart';
import 'package:uni_project/core/widgets/label_widget.dart';
import 'package:uni_project/feature/home/domain/entities/home_entity.dart';

class DetailPage extends StatefulWidget {
  final CoinEntity homeEntity;

  const DetailPage({
    Key? key,
    required this.homeEntity,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.homeEntity.name!,
          style: const TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LabelWidget(url: widget.homeEntity.image ?? ''),
                  Column(
                    children: [
                      Text(
                        widget.homeEntity.name!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Price : ${widget.homeEntity.currentPrice!}',
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 10,
                ),
                child: Divider(
                  color: Colors.white,
                  height: 2,
                ),
              ),
              ExpansionTile(
                title: const Text(
                  'Crypto basic info',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      'A cryptocurrency is a digital currency, which is an alternative form of payment created using encryption algorithms. The use of encryption technologies means that cryptocurrencies function both as a currency and as a virtual accounting system. To use cryptocurrencies, you need a cryptocurrency wallet',
                      style: TextStyle(color: Colors.blue.shade100),
                    ),
                  )
                ],
              ),
              _basicInfoWidget(),
              _dataDisplay(
                info: widget.homeEntity.priceChange24h.toString(),
                title: 'daily changes',
              ),
              // _changesInfoDisplay(
              //   the1d: widget.homeEntity.the7D!,
              //   title: 'weekly changes',
              // ),
              // _changesInfoDisplay(
              //   the1d: widget.homeEntity.the30D!,
              //   title: 'month changes',
              // ),
              // _changesInfoDisplay(
              //   the1d: widget.homeEntity.the365D!,
              //   title: 'yearly changes',
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _basicInfoWidget() => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Text(
                  '${widget.homeEntity.name!} info',
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _dataDisplay(
              title: 'name',
              info: widget.homeEntity.name!,
            ),
            _dataDisplay(
              title: 'price',
              info: widget.homeEntity.currentPrice.toString(),
            ),
            _dataDisplay(
              title: 'Total supply',
              info: widget.homeEntity.totalSupply.toString(),
            ),
            _dataDisplay(
              title: 'Max supply',
              info: widget.homeEntity.maxSupply.toString(),
            ),
            _dataDisplay(
              title: 'currency',
              info: widget.homeEntity.currentPrice.toString(),
            ),
            _dataDisplay(
              title: 'Market cap',
              info: widget.homeEntity.marketCap.toString(),
            ),
            _dataDisplay(
              title: 'Market cap Change 24h',
              info: widget.homeEntity.marketCapChange24h.toString()!,
            ),
            // _dataDisplay(
            //   title: 'Num exchanges',
            //   info: widget.homeEntity.numExchanges!,
            // ),
            // _dataDisplay(
            //   title: 'Num pairs',
            //   info: widget.homeEntity.numPairs!,
            // ),
            // _dataDisplay(
            //   title: 'Num pairs unmapped',
            //   info: widget.homeEntity.numPairsUnmapped!,
            // ),
            // _dataDisplay(
            //   title: 'plat form currency',
            //   info: widget.homeEntity.platformCurrency!,
            // ),
            // _dataDisplay(
            //   title: 'plat form currency',
            //   info: widget.homeEntity.platformCurrency!,
            // ),
            // _dataDisplay(
            //   title: 'price date',
            //   info: widget.homeEntity.priceDate.toString(),
            // ),
          ],
        ),
      );

  Widget _dataDisplay({required String title, required String info}) {
    const TextStyle textStyle = TextStyle(
      color: Colors.white,
    );
    return info.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 5,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.cyanAccent,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    info,
                    style: textStyle,
                  ),
                )
              ],
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _changesInfoDisplay({required String the1d, required String title}) =>
      Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // _dataDisplay(
            //   title: 'market cap change',
            //   info: the1d.marketCapChange!,
            // ),
            // _dataDisplay(
            //   title: 'market cap change pct',
            //   info: the1d.marketCapChangePct!,
            // ),
            // _dataDisplay(
            //   title: 'price change',
            //   info: the1d.priceChange!,
            // ),
            // _dataDisplay(
            //   title: 'price change pct',
            //   info: the1d.priceChangePct!,
            // ),
            // _dataDisplay(
            //   title: 'volume',
            //   info: the1d.volume!,
            // ),
            // _dataDisplay(
            //   title: 'volume change',
            //   info: the1d.volumeChange!,
            // ),
            // _dataDisplay(
            //   title: 'volume change pct',
            //   info: the1d.volumeChangePct!,
            // )
          ],
        ),
      );
}
