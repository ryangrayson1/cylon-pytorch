SHELL=/bin/bash
USER_SCRATCH=/scratch/${USER}
#
# this needs to be fixed
#
PROJECT_DIR=${USER_SCRATCH}/cylon-pytorch
# PROJECT_DATA=${USER_SCRATCH}/data

NAME=cylon-pytorch

.PHONY: image-singularity image-docker

all: requirements data

cloudmesh-install:
	pip install cloudmesh-common -U
	pip install cloudmesh-vpn -U
	pip install cloudmesh-ee -U


requirements:
	time pip install -r requirements.txt

data:
	# fix me

project: project.json generate

generate: jobs-project.sh 

run: submit

submit:
	-sh jobs-project.sh


jobs-%.sh: %.json
	cms sbatch generate submit --name=$<  > $@


%.json: 
	cms sbatch generate \
	           --source=job.in.slurm \
	           --config=$< \
	           --name=$(basename $@) \
	           --noos \
	           --os=USER,HOME \
		       --nocm \
	           --output_dir=./$(basename $@) \
               --source_dir=. \
               --verbose

kill: stop

stop:
	for i in "$$(squeue --user $$USER | awk 'NR>1{print $$1}')"; do scancel $$i ; done

inspect:
	$(eval D=$(shell ls project/$(ls -1) | head -n 1))
	echo ${D}
	$(shell emacs project/${D}/config.yaml project/${D}/job.slurm)

watch: status

status:
	watch squeue --format=\"%.18i %.9P %.50j %.8u %.8T %.10M %.9l %.6D %R\" --me


clean:
	@-rm -rf project project.json jobs-project.sh
	@-rm -f rivanna.slurm
	@-rm -rf '__pycache__'
	@-rm -rf *~



image:
	cms rivanna singularity build multigpu.def

run:
	# fix me

shell:
	# fix me
