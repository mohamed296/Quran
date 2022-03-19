import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_shert/view/detalth_soura.dart';
import 'package:t_shert/provider/cubit.dart';
import 'package:t_shert/provider/state.dart';

class Soura extends StatelessWidget {
  const Soura({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppCubit()..getsoura(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context).souraModel;
          return Scaffold(
            appBar: AppBar(
              title: const Text("AZKAR"),
            ),
            body: state is GetAzkerLoding
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (_, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        elevation: 5.0,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: DetetheSoura(
                                          index: cubit!.soura[index].pages,
                                        )),
                              ),
                            );
                          },
                          leading: CircleAvatar(
                            backgroundColor: Colors.amber,
                            child: Text("$index"),
                          ),
                          title: Text(
                            "${cubit!.soura[index].titleAr}",
                            style: const TextStyle(
                                fontSize: 18, color: Colors.blueGrey),
                          ),
                          subtitle: Text("${cubit.soura[index].count}"),
                        ),
                      );
                    },
                    itemCount: cubit!.soura.length),
          );
        },
      ),
    );
  }
}


// Card(
//                         elevation: 8.0,
//                         child:Container(
//                                 height: 200,
//                                 width: double.infinity,
//                                 child: Row(
//                                   children: [
//                                     const SizedBox(
//                                       width: 20.0,
//                                     ),
//                                     Text("$index"),
//                                     const SizedBox(
//                                       width: 20.0,
//                                     ),
//                                     Text("${cubit!.azkar[index].title}")
//                                   ],
//                                 ),
//                               ),
//                       );