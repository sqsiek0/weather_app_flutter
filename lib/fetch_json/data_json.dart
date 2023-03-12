import 'package:flutter/material.dart';
import 'package:testing_cz2/fetch_json/collecting_data.dart';

class JsonFetchData extends StatefulWidget {
  const JsonFetchData({super.key});

  @override
  State<JsonFetchData> createState() => _JsonFetchDataState();
}

class _JsonFetchDataState extends State<JsonFetchData> {
  late Future<List<RandomJoke>> jokesFuture;

  @override
  void initState() {
    super.initState();
    jokesFuture = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("dupsko"),
      ),
      body: FutureBuilder(
        future: jokesFuture,
        builder: (context, AsyncSnapshot snapshot) {
          List<RandomJoke> apiData;
          if (snapshot.hasData) {
            apiData = snapshot.data;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: createListViewOfJson(apiData, context)),
                Expanded(
                    child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: TextButton(
                            onPressed: refresh, child: Text("siema"))))
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Future refresh() async {
    late Future<List<RandomJoke>> jokesFuturetemp = fetchData();

    setState(() {
      jokesFuture = jokesFuturetemp;
    });
  }

  Widget createListViewOfJson(List<RandomJoke> apiData, BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: apiData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(apiData[index].setup),
            subtitle: Text(apiData[index].punchline),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: FittedBox(child: Text(apiData[index].id.toString())),
            ),
          );
        },
      ),
    );
  }
}
