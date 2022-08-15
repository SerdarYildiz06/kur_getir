import 'package:flutter/material.dart';
import 'package:kurgetir/api_provider.dart';
import 'package:provider/provider.dart';

import 'kur_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final model = Provider.of<ApiProvider>(context, listen: false);
    model.getKur();
  }

  @override
  Widget build(BuildContext context) {
    ApiProvider model = Provider.of<ApiProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: RefreshIndicator(
        onRefresh: () async {
          await model.getKur();
        },
        child: ListView.builder(
          itemCount: model.model?.tCMBAnlikKurBilgileri?.length,
          itemBuilder: (context, index) {
            TCMBAnlikKurBilgileri? data = model.model?.tCMBAnlikKurBilgileri?[index];

            return model.loading
                ? const CircularProgressIndicator()
                : Card(
                    child: SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 125,
                            child: Text(
                              data!.currencyName!.toTitleCase(),
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/forex.png',
                                height: 50,
                                width: 50,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Image.asset(
                                'assets/bank_icon.png',
                                height: 50,
                                width: 50,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Text('Forex Buying ${data.forexBuying?.toString()}'),
                              Text('Forex Selling ${data.forexSelling.toString()}'),
                              const SizedBox(
                                height: 45,
                              ),
                              Text('Bank Buying ${data.banknoteBuying?.toString()}'),
                              Text('Bank Selling ${data.banknoteSelling?.toString()}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      )),
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
