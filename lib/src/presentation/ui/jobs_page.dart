import 'package:api_task/core/data/models/api_response_model.dart';
import 'package:api_task/src/data/models/jobs_model.dart';
import 'package:api_task/src/presentation/blocks/job_blocs.dart';
import 'package:api_task/src/presentation/blocks/job_event.dart';
import 'package:api_task/src/presentation/blocks/job_state.dart';
import 'package:api_task/src/presentation/ui/single_job_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  final JobBloc _newsBloc = JobBloc();

  @override
  void initState() {
    _newsBloc.add(GetJobList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job list')),
      body: _buildjobList(),
    );
  }

  Widget _buildjobList() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<JobBloc, JobState>(
          listener: (context, state) {
            if (state is JobError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<JobBloc, JobState>(
            builder: (context, state) {
              if (state is JobInitial) {
                return _buildLoading();
              } else if (state is JobLoading) {
                return _buildLoading();
              } else if (state is JobsLoaded) {
                return _buildCard(context, state.jobs);
              } else if (state is JobInitial) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, Responses<Jobs?> model) {
    return ListView.builder(
      itemCount: model.data!.data!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => JobDetail(
                      jobs: model.data!.data![index],
                    )));
          },
          child: Container(
            color: model.data!.data![index].isFeatured!
                ? Colors.green
                : Colors.white,
            margin: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Job Title: ${model.data!.data![index].jobTitle}"),
                        Text(
                            "Company Name: ${model.data!.data![index].recruitingCompanySProfile}"),
                        Text("Deadline: ${model.data!.data![index].deadline}"),
                        // Text(
                        //     "Min salary: ${model.data![index].minSalary == "" ? 0 : model.data![index].minSalary}"),
                        // Text(
                        //     "Max salary: ${model.data![index].maxSalary == "" ? 0 : model.data![index].maxSalary}"),
                      ],
                    ),
                    Column(
                      children: [
                        model.data!.data![index].isFeatured!
                            ? const Icon(
                                Icons.star_border,
                                color: Colors.green,
                              )
                            : Container(),
                        Image.network(
                          '${model.data!.data![index].logo}',
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
