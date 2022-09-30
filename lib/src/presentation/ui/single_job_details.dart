import 'package:flutter/material.dart';

class JobDetail extends StatefulWidget {
  const JobDetail({Key? key, required this.jobs}) : super(key: key);
  final jobs;

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  @override
  Widget build(BuildContext context) {
    int minExp = 0;
    int maxExp = 0;

    if (widget.jobs.minExperience != null) {
      setState(() {
        minExp = widget.jobs.minExperience;
      });
    }
    if (widget.jobs.maxExperience != null) {
      setState(() {
        maxExp = widget.jobs.maxExperience;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title: ${widget.jobs.jobTitle}'),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Deadline: ${widget.jobs.jobDetails!.lastDate}'),
                        const SizedBox(
                          height: 20,
                        ),
                        minExp == 0 && maxExp == 0
                            ? const Text('Experience (years): 0')
                            : minExp != 0 && maxExp != 0
                                ? Text(
                                    'Experience (years):  ${widget.jobs.minExperience ?? ""} - ${widget.jobs.maxExperience ?? ""} ')
                                : minExp == 0
                                    ? Text(
                                        'Experience (years): Up to ${maxExp}')
                                    : Text(
                                        'Experience (years): at least ${minExp}'),
                        const SizedBox(
                          height: 20,
                        ),
                        widget.jobs.minSalary == "" ||
                                widget.jobs.maxSalary == ""
                            ? Text('Salary: Negotiable')
                            : Text(
                                'Salary:  ${widget.jobs.minSalary} - ${widget.jobs.maxSalary}'),
                      ],
                    ),
                    Image.network(
                      '${widget.jobs.logo}',
                      height: 20,
                    )
                  ],
                ),
              ),
              // Row(
              //   children: [Text('${jobs.jobDetails!.applyInstruction}')],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
