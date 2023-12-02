import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:liftbros_mobile/constants.dart';
import 'package:liftbros_mobile/data/api_provider.dart';
import 'package:liftbros_mobile/data/auth_provider.dart';
import 'package:liftbros_mobile/data/dtos/user_dto.dart';

class ContentFragment extends StatefulWidget {
  const ContentFragment({required this.callback, super.key});

  final Function callback;

  @override
  State<ContentFragment> createState() => _ContentFragmentState();
}

class _ContentFragmentState extends State<ContentFragment> {
  final apiProvider = GetIt.instance<ApiProvider>();
  final authProvider = GetIt.instance<AuthProvider>();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        FutureBuilder(
            future: apiProvider.user(authProvider.userId!),
            builder: (BuildContext context, AsyncSnapshot<UserDto> snapshot) {
              if (snapshot.hasData) {
                UserDto user = snapshot.data!;

                return Column(
                  children: [
                    Text(user.id.toString()),
                    Text(user.username),
                    Text(user.privacyLevel.toString()),
                  ],
                );
              }

              return const CircularProgressIndicator(color: darkerColor);
            }),
        InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            widget.callback();
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: darkerColor, borderRadius: BorderRadius.circular(8.0)),
            padding: const EdgeInsets.all(16.0),
            child: const Center(
              child: Text('Stop Lifting',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    ));
  }
}
