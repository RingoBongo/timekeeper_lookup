import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/timekeepers/data/models/timekeeper_detail_model.dart';
import 'package:myapp/features/timekeepers/domain/entities/timekeeper_detail.dart';
import 'package:myapp/features/timekeepers/presentation/pages/home/bloc/timekeeper_search_bloc.dart';

import '../../../../../../injection_container.dart';

class Home_Page extends StatefulWidget {
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final TextEditingController searchCriteriaTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<TimekeeperSearchBloc>();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('HomePage'),
        ),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Text(
                      'Please enter the three characters of a timekeeper.'),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: SizedBox(
                  width: 400,
                  child:
                      BlocBuilder<TimekeeperSearchBloc, TimekeeperSearchState>(
                          builder: (context, state) {
                    return TextFormField(
                      onChanged: (value) {},
                      controller: searchCriteriaTextEditingController,
                      onFieldSubmitted: (value) {
                        print('submitted1 $value');

                        try {
                          BlocProvider.of<TimekeeperSearchBloc>(context).add(
                              SearchEvent(
                                  searchTerm:
                                      searchCriteriaTextEditingController
                                          .value.text));
                        } catch (e) {
                          print(e);
                        }
                        print('submitted2 $value');
                      },
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                        labelText: 'Search Criteria',
                        isDense: false,
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            BlocBuilder<TimekeeperSearchBloc, TimekeeperSearchState>(
                builder: (context, state) {
              print('BlocBuilder : $state');
              print('${state.runtimeType}');

              switch (state.runtimeType) {
                case SearchLoading:
                  return _buildSearchProgress();
                case SearchComplete:
                  if ((state as SearchComplete).timekeepers.length > 0) {
                    return _buildResults((state as SearchComplete).timekeepers);
                  } else {
                    return Card(
                      child: Text('No timekeepers found'),
                    );
                  }
                  break;
                default:
                  // do nothing
                  return Container();
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchProgress() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(75),
        child: SizedBox(
          height: 200,
          width: 200,
          child: CircularProgressIndicator(
            strokeWidth: 10,
          ),
        ),
      ),
    );
  }

  Widget _buildResults(List<TimeKeeperDetailModel> timekeepers) {
    return Column(
      children: [
        ...timekeepers.map(
          (t) {
            print(t.tkinit);
            return BlocBuilder<TimekeeperSearchBloc, TimekeeperSearchState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 380,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('${t.tkinit} - ${t.detail}'),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        )
      ],
    );
  }
}
