#! /bin/bash

# author wangyansnow

build_path=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)
echo "工程目录：${build_path}................."
cd ${build_path}

scheme_name="WYCountingLabel"
infoplis_path=${build_path}/${scheme_name}/Info.plist

# 1.拉取最新代码
git pull origin master

# 2.获取build,version,bundleIdentifier的值
version=$(/usr/libexec/PlistBuddy -c "print CFBundleShortVersionString" ${infoplis_path})
build=$(/usr/libexec/PlistBuddy -c "print CFBundleVersion" ${infoplis_path})
bundleIdentifier=$(/usr/libexec/PlistBuddy -c "print CFBundleIdentifier" ${infoplis_path})
echo "version: ${version}, build: ${build}, bundleIdentifier: ${bundleIdentifier}"

# 3.对build自增1
echo "初始build = ${build}"
build=$((${build}+1))
/usr/libexec/Plistbuddy -c "Set CFBundleVersion ${build}" "${infoplis_path}"
Version_result=$(/usr/libexec/PlistBuddy -c "print CFBundleShortVersionString" ${App_infoplist_path})
echo "build改变后 = ${build}"

# 4.修改bundleIdentifier
release_bundleId="com.wy.NotchFace.test"
/usr/libexec/Plistbuddy -c "Set CFBundleIdentifier ${release_bundleId}" "${infoplis_path}"
newId=$(/usr/libexec/PlistBuddy -c "print CFBundleIdentifier" ${infoplis_path})
echo "打包时的bundleIdentifier = ${newId}"

# 5.恢复bundleIdentifier
/usr/libexec/Plistbuddy -c "Set CFBundleIdentifier ${bundleIdentifier}" "${infoplis_path}"
oldBundleId=$(/usr/libexec/PlistBuddy -c "print CFBundleIdentifier" ${infoplis_path})
echo "恢复后的bundleIdentifier = ${oldBundleId}"

# 6.提交对版本号的修改
git add .
git commit -m "王俨test${build}"
git push origin master

