import 'package:api_task/core/data/models/api_response_model.dart';
import 'package:api_task/src/data/models/jobs_model.dart';
import 'package:equatable/equatable.dart';

abstract class JobState extends Equatable {
  const JobState();

  @override
  List<Object?> get props => [];
}

class JobInitial extends JobState {}

class JobLoading extends JobState {}

class JobsLoaded extends JobState {
  final Responses<Jobs?> jobs;
  const JobsLoaded(this.jobs);
}

class JobError extends JobState {
  final String? message;
  const JobError(this.message);
}
