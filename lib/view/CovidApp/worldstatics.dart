import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:restapi/models/CovidAppModel/world.dart';
import 'package:restapi/services/stats_services.dart';
import 'package:restapi/view/CovidApp/country_list.dart';

class WorldStats extends StatefulWidget {
  const WorldStats({super.key});

  @override
  State<WorldStats> createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldStats> with TickerProviderStateMixin {
  StatsServies statesServices = StatsServies();
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246)
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('WorldStats'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * .1,
            ),
            FutureBuilder(
                future: statesServices.fetchdata(),
                builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                        child: SpinKitFadingCircle(
                      color: Colors.white,
                      size: 50.0,
                      controller: _controller,
                    ));
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            'total': double.parse(
                                snapshot.data!.updatedInfo!.cases.toString()),
                            'recovered': double.parse(snapshot
                                .data!.updatedInfo!.todayRecovered
                                .toString()),
                            'death': double.parse(
                                snapshot.data!.updatedInfo!.deaths.toString()),
                          },
                          chartRadius: MediaQuery.of(context).size.width / 2.9,
                          animationDuration: const Duration(milliseconds: 1200),
                          chartType: ChartType.ring,
                          colorList: colorList,
                          legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.left),
                          chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * .02,
                          ),
                          child: Card(
                            color: Colors.white,
                            child: Column(
                              children: [
                                ReuseableRow(
                                    title: 'Total',
                                    value: snapshot.data!.updatedInfo!.cases
                                        .toString()),
                                ReuseableRow(
                                    title: 'Recovered',
                                    value: snapshot
                                        .data!.updatedInfo!.todayRecovered
                                        .toString()),
                                ReuseableRow(
                                    title: 'Deaths',
                                    value: snapshot.data!.updatedInfo!.deaths
                                        .toString()),
                                ReuseableRow(
                                    title: 'TodayCases',
                                    value: snapshot.data!.updatedInfo!.todayCases
                                        .toString()),
                                ReuseableRow(
                                    title: 'TodayRecoverd',
                                    value: snapshot
                                        .data!.updatedInfo!.todayRecovered
                                        .toString()),
                                ReuseableRow(
                                    title: 'TodayDeath',
                                    value: snapshot.data!.updatedInfo!.deaths
                                        .toString()),
                                ReuseableRow(
                                    title: 'Active',
                                    value: snapshot.data!.updatedInfo!.active
                                        .toString()),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const CountryStatsScreen())));
                          },
                          child: Container(
                            height: 40,
                            width: 280,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.green.shade800),
                            child: const Center(
                              child: Text(
                                'Track',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ReuseableRow extends StatelessWidget {
  String title, value;
  ReuseableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 7, right: 7, top: 7, bottom: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        const Divider(color: Colors.black),
      ],
    );
  }
}

// json data
/*
{
    "updated": "2024-02-19",
    "country": "United States",
    "updatedInfo": {
        "updated": 100,
        "cases": 4334,
        "todayCases": 234234,
        "deaths": 123,
        "recovered": 123,
        "todayRecovered": 543,
        "active": 323,
        "critical": 234,
        "casesPerOneMillion": 4234,
        "deathsPerOneMillion": 234,
        "tests": 423,
        "testsPerOneMillion": 234,
        "population": 0,
        "oneCasePerPeople": 423,
        "oneDeathPerPeople": 423,
        "oneTestPerPeople": 12,
        "activePerOneMillion": 123,
        "recoveredPerOneMillion": 321,
        "criticalPerOneMillion": 32,
        "affectedCountries": 432
    }
} */