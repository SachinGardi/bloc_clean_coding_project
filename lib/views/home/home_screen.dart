import 'package:bloc_clean_coding_project/bloc/movies_bloc/movies_bloc.dart';
import 'package:bloc_clean_coding_project/services/storage/local_storage.dart';
import 'package:bloc_clean_coding_project/utils/enums.dart';
import 'package:flutter/material.dart';
import '../../config/components/network_image_widget.dart';
import 'widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocalStorage storage =  LocalStorage();

  late MoviesBloc moviesBloc;

  @override
  void initState() {
    moviesBloc = MoviesBloc(moviesRepository: getIt());
    super.initState();
  }

  @override
  void dispose() {
    moviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.popularShows),
        centerTitle: true,
        actions: const [
       LogoutButtonWidget(),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: BlocProvider(
          create: (context) => moviesBloc..add(MoviesFetched()),
          child: BlocBuilder<MoviesBloc,MoviesState>(
              builder: (context, state) {
                switch(state.moviesList.status){
                  case Status.loading:
                    return const Center(child: CircularProgressIndicator(),);

                  case Status.error:
                    return const MoviesErrorWidget();

                  case Status.complete:

                    if(state.moviesList.data == null){
                      return  Center(child: Text(AppLocalizations.of(context)!.noDataFound),);
                    }
                    final moviesList = state.moviesList.data!;

                    return ListView.builder(
                      itemCount: moviesList.tvShow.length,
                        itemBuilder: (context, index) {
                        final tvShow = moviesList.tvShow[index];
                          return Card(
                            child: ListTile(
                              leading: NetworkImageWidget(
                                borderRadius: 5,
                                imageUrl: tvShow.imageThumbnailPath.toString(),
                              ),
                              title: Text(tvShow.name),
                              subtitle: Text(tvShow.network),
                              trailing: Text(tvShow.status),
                            ),
                          );
                        },
                    );

                  default:
                    return const SizedBox();
                }
              },),
      ),
    );

  }
}
