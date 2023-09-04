ERROR: executing command 'ee generate submit --name=project.json'
======================================================================
[Errno 2] No such file or directory: 'project.json'
[Errno 2] No such file or directory: 'project.json'
Traceback (most recent call last):
  File "/gpfs/gpfs0/project/bii_dsc_community/rtg5xkh/cloudmesh-cmd5/cloudmesh/shell/shell.py", line 1103, in main
    stop = cmd.onecmd(command)
           ^^^^^^^^^^^^^^^^^^^
  File "/gpfs/gpfs0/project/bii_dsc_community/rtg5xkh/cloudmesh-cmd5/cloudmesh/shell/shell.py", line 421, in onecmd
    return func(arg)
           ^^^^^^^^^
  File "/gpfs/gpfs0/project/bii_dsc_community/rtg5xkh/cloudmesh-cmd5/cloudmesh/shell/command.py", line 112, in new
    func(instance, args, arguments)
  File "/gpfs/gpfs0/project/bii_dsc_community/rtg5xkh/cloudmesh-ee/cloudmesh/ee/command/ee.py", line 198, in do_ee
    ee.generate_submit(name=arguments.name, job_type=job_type)
  File "/gpfs/gpfs0/project/bii_dsc_community/rtg5xkh/cloudmesh-ee/cloudmesh/ee/experimentexecutor.py", line 623, in generate_submit
    experiments = json.loads(readfile(name))
                             ^^^^^^^^^^^^^^
  File "/gpfs/gpfs0/project/bii_dsc_community/rtg5xkh/cloudmesh-common/cloudmesh/common/util.py", line 482, in readfile
    with open(path_expand(filename), mode) as f:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: 'project.json'

======================================================================
