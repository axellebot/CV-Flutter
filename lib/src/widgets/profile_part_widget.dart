import 'package:cv/src/blocs/bloc_provider.dart';
import 'package:cv/src/blocs/profile_part_bloc.dart';
import 'package:cv/src/models/profile_part_model.dart';
import 'package:flutter/material.dart';

class ProfilePart extends StatelessWidget {
  ProfilePart(this.profilePartId);

  final String profilePartId;

  @override
  Widget build(BuildContext context) {
    ProfilePartBloc _profilePartBloc =
        BlocProvider.of<ProfilePartBloc>(context);
    _profilePartBloc.fetchProfilePart(profilePartId);

    return StreamBuilder<ProfilePartModel>(
      stream: _profilePartBloc.profileStream,
      builder:
          (BuildContext context, AsyncSnapshot<ProfilePartModel> snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.toString());
        }
        return Text("Loading profile part $profilePartId");
      },
    );
  }
}
