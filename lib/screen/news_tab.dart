import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c9_friday/screen/cubit/cubit.dart';
import 'package:news_c9_friday/screen/cubit/states.dart';
import 'package:news_c9_friday/screen/repo/remote_ds.dart';
import 'package:news_c9_friday/screen/tab_controller.dart';

import '../shared/network/remote/api_manager.dart';

class NewsTab extends StatelessWidget {
  String catId;

  NewsTab(this.catId);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(RemoteDataSource())..getSources(catId),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetSourcesLoadingState ||
              state is HomeGetNewsDataLoadingState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (state is HomeGetSourcesErrorState) {
            print(state.error);
          } else if (state is HomeGetSourcesSuccessState ||
          state is HomeChangeSourceState) {
            HomeCubit.get(context).getNewsData();
          }else if(state is HomeGetNewsDataSuccessState){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return TabControllerWidget();
        },
      ),
    );
  }
}
