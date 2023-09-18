import 'package:flutter/material.dart';

import '../models/quotes_model.dart';
import '../services/api_services.dart';
import '../widgets/quote_card.dart';
import 'package:provider/provider.dart';

class AllQuotesScreen extends StatefulWidget {
  const AllQuotesScreen({super.key});

  @override
  State<AllQuotesScreen> createState() => _AllQuotesScreenState();
}

class _AllQuotesScreenState extends State<AllQuotesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quotes',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder<List<Quotes>>(
                future: APIServices.getAllQuotes(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('An error has occured: ${snapshot.hasError}'),
                    );
                  } else if (snapshot.data == null) {
                    return const Center(
                      child: Text('No quotes has been fetched yet!!!'),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ChangeNotifierProvider.value(
                              value: snapshot.data![index],
                              child: const QuoteCard());
                        }),
                  );
                })
          ],
        ),
      )),
    );
  }
}
