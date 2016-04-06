# docker-machine util

dm-eval() {
    COUNT=`docker-machine ls | grep "Running" | wc -l`
    if [[ "${COUNT// /}" == "1" ]]
    then
      RUNNING_MACHINE=`docker-machine ls | grep "Running" | awk '{print $1;}'`
      RUNNING_MACHINE_DRIVER=`docker-machine ls | grep "Running" | awk '{print $3;}'`
      while IFS= read -r line
      do
        if [[ $line == 'export'* ]]
        then
          eval $line
        fi
      done < <(docker-machine env $RUNNING_MACHINE)
      echo "Docker environment set for $RUNNING_MACHINE ($RUNNING_MACHINE_DRIVER)"
    else
      echo "Unable to set Docker environment"
    fi
}

dm-host() {
  COUNT=`docker-machine ls | grep "Running" | wc -l`
  if [[ "${COUNT// /}" == "1" ]]
  then
    dm-eval

  	# clear existing docker.local entry from /etc/hosts
  	sudo sed -i '' '/[[:space:]]docker\.local$/d' /etc/hosts

  	# get ip of running machine
  	export DOCKER_IP=`docker-machine ip $DOCKER_MACHINE_NAME`

  	# update /etc/hosts with docker machine ip
    echo "added docker.local ($DOCKER_IP) to /etc/hosts"
  	[[ -n $DOCKER_IP ]] && sudo /bin/bash -c "echo \"${DOCKER_IP}	docker.local\" >> /etc/hosts"
  else
      echo "Unable to set Docker environment"
  fi
}

dm-fusion() {
  docker-machine create --driver vmwarefusion default
}

export FUSION_NO_SHARE=true
export FUSION_CPU_COUNT=2
export FUSION_MEMORY_SIZE=2048
