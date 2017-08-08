#!/bin/bash
if [ "$1" == "-f" ] ;then
  if [ "$2" == "" ] || [ "$3" == "" ] ;then
    echo "인자를 입력하세요."
    echo "ex) ./compose.sh start"
    exit 1
  else
    docker-compose -f compose/docker-compose-$2.yml -p hive $3 $4
  fi
else
  if [ "$1" == "" ] ;then
    echo "인자를 입력하세요."
    echo ""
    echo "ex1) ./compose.sh start"
    echo "ex2) ./compose.sh -f dev start"
    echo ""
    echo "[ -f option ]"
    echo "  compose 디렉토리 내 docker-compose-???.yml 형태로 파일 생성"
    echo "  ex) compose/docker-compose-elk.yml로 설정한 경우 -> ./compose.sh -f elk build"
    echo ""
    echo "-f 옵션 미지정 시 docker-compose.yml 구동."
    echo ""
    echo ""
    exit 1
  fi
  docker-compose -f compose/docker-compose.yml -p hive $1 $2
fi
