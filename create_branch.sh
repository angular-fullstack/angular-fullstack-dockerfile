#!/usr/bin/env bash 

MY_PATH="`dirname \"$0\"`"
cd ${MY_PATH}

#find the generator-angular-fullstack source
#this is usually 2 direcories up as this is a submodule
#but use your own if you want to
FULLSTACK_DIR=${DEFAULT_FULLSTACK_DIR:='..'}

echo "Using ${FULLSTACK_DIR} to create branch"

ver=$(grep version ${FULLSTACK_DIR}/package.json |cut -f2 -d:|sed -e 's/"//g; s/,//; s/ //g')

echo "attempting to checkout ${ver} branch"
git checkout  ${ver} 
if [ $? != 0 ]; then
	echo "attempting to create ${ver} branch from master"
	git pull origin master
	git checkout -b ${ver} master
	if [ $? != 0 ]; then
		echo "failed to create branch, exitting"
		exit 99
	fi
fi

echo "building package.json, typings.json and Dockerfile"
sed -e 's/<%.*%>//; /name/d' ${FULLSTACK_DIR}/templates/app/_package.json > package.json
sed -e 's/<%.*%>//; /name/d' "${FULLSTACK_DIR}/templates/app/typings(ts).json" > typings.json

sed  -i .bak "s/LABEL.*/LABEL \"version\"=\"${ver}\"/" Dockerfile
sed  -i  .bak "s/\"version\".*/\"version\": \"${ver}\",/" package.json

git add .
git commit -m "circleci push to ${ver}"
git push origin ${ver}

