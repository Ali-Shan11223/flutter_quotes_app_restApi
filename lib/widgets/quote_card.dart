import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/quotes_model.dart';
import '../providers/favorite_provider.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Quotes>(context);
    final favoriteProvider = Provider.of<Favorite>(context, listen: false);
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                height: size.width * 0.15,
                width: size.width * 0.15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: Image.asset(
                  'assets/images/icon.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                provider.quote.toString(),
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                provider.author.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      favoriteProvider.addToFavorites(Quotes(
                          id: provider.id,
                          quote: provider.quote,
                          author: provider.author,
                        ));
                    },
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                  const Icon(
                    Icons.share_outlined,
                    color: Colors.blue,
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
