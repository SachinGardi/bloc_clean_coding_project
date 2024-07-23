import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .1,
        ),
        const Icon(
          Icons.cloud_off,
          size: 50,
          color: Colors.red,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              'We\'re unable to show result.\n Please check your data\n connection.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 20),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .15,
        ),
        ElevatedButton(
            onPressed: onPress,
            child: Center(child: Text('Retry',style: Theme.of(context).textTheme.bodySmall,))
        )
      ],
    );
  }
}
