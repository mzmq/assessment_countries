import 'package:assessment_countries/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  // initial value onChange Checkbox
  bool name = true;
  bool currency = true;
  bool unicodeFlag = true;
  bool flag = true;



  @override
  Widget build(BuildContext context) {
    final getDate = Provider.of<ApiProvider>(context).fetchCount();

    return Scaffold(
      appBar: AppBar(
        title: const Text('API Country assignment '),
      ),
      body: FutureBuilder(
          future: getDate,
          builder: (ctx, AsyncSnapshot snapshot) {
            final data = snapshot.data;

            if (snapshot.hasData) {
              return Column(
                children: [
                  // All Checkbox ---------------------------------------------------
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      // listview scroll direction ->  horizontal scroll
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          // country checkbox ------------------------
                          Row(
                            children: [
                              const Text(
                                'country',
                                style: TextStyle(fontSize: 20),
                              ),
                              Checkbox(
                                  value: name,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      name = value!;
                                    });
                                  }),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: VerticalDivider(thickness: 2),
                          ),
                          // currency checkbox ------------------------
                          Row(
                            children: [
                              const Text(
                                'currency',
                                style: TextStyle(fontSize: 20),
                              ),
                              Checkbox(
                                  value: currency,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      currency = value!;
                                    });
                                  }),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: VerticalDivider(thickness: 2),
                          ),
                          // unicodeFlag checkbox ----------------------
                          Row(
                            children: [
                              const Text(
                                'unicodeFlag',
                                style: TextStyle(fontSize: 20),
                              ),
                              Checkbox(
                                  value: unicodeFlag,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      unicodeFlag = value!;
                                    });
                                  }),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: VerticalDivider(thickness: 2),
                          ),
                          // Flag checkbox -----------------------------
                          Row(
                            children: [

                              const Text(
                                'Flag',
                                style: TextStyle(fontSize: 20),
                              ),
                              Checkbox(
                                  value: flag,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      flag = value!;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(thickness: 2),
                  // View all fetched data ------------------------------------------
                  Expanded(
                    flex: 5,
                    child: ListView.builder(
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (ctx, i) {
                          var svgImage = data["data"][i]["flag"];

                          return ListTile(
                            trailing: Visibility(
                              visible: flag,
                              child: svgImage == null
                                  ? SvgPicture.asset('assets/images/flag.svg',
                                      width: 50)
                                  : SvgPicture.network(svgImage, width: 50),
                            ),
                            title: Text(name ? data["data"][i]["name"] : ''),
                            subtitle: Row(
                              children: [
                                Text(currency
                                    ? 'Currency ${data["data"][i]["currency"]}'
                                    : ''),
                                const VerticalDivider(),
                                Text(unicodeFlag
                                    ? 'unicodeFlag  ${data["data"][i]["unicodeFlag"]}'
                                    : ''),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            } else {
              // Circular Progress Indicator ()------------------------------------------
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
