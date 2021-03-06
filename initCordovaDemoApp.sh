#!/bin/bash

APP_NAME="BlinkInputDemo"

# position to a relative path
HERE="$(dirname "$(test -L "$0" && readlink "$0" || echo "$0")")"
pushd "${HERE}" >> /dev/null

# remove any existing code
rm -rf $APP_NAME

# create a sample application
cordova create $APP_NAME com.microblink.blinkinput $APP_NAME

# enter into demo project folder
cd $APP_NAME

# add the BlinkInput plugin
cordova plugin add ../BlinkInput --variable CAMERA_USAGE_DESCRIPTION="Camera permission is required for automated scanning"

# add ios and android support to the project
cordova platform add android@8
cordova platform add ios

# copy content of the www folder
cp  -f -r ../www .

# build app
cordova prepare

# how to run
echo "To run iOS demo application open Xcode project $APP_NAME.xcodeproj"
echo "To run Android demo application, position to $APP_NAME folder and type: cordova run android"
