import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_riverpod_dio/providers/quote_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void _refresh(WidgetRef ref) {
    ref.refresh(quoteProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _Quote(),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, _) => FloatingActionButton(
          onPressed: () => _refresh(ref),
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}


class _Quote extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quoteApiProvider = ref.watch(quoteProvider);
    return quoteApiProvider.when(
      loading: () => CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.black),),
      error: (_, __) => ErrorScreen(),
      data: (data) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(30),
          itemCount: data.quotes!.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width - 60,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data.quotes![index].text!, style: Theme.of(context).textTheme.headline5,),
                  SizedBox(height: 20,),
                  Text(data.quotes![index].author!, style: Theme.of(context).textTheme.subtitle2,)
                ],
              ),
            );
          },
        );
      }
    );
  }
}


class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Error occured'),
    );
  }
}
