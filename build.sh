#!/bin/bash

set -e

CWD=`pwd`


do_build() {
	echo "Building..."
        rm -rf $OUTPUT
	mkdir -p $OUTPUT
	cd $CWD
        go get
	GOOS="$GOOS" GOARCH="$GOARCH" go build -ldflags="$LDFLAGS" -o $OUTPUT/$HARNESS
	rsync -a curricula repository $OUTPUT/
}

do_zip() {
	cd $OUTPUT
        cd ..
	zip -qr ../$ZIP lesson-planner-prototype
	cd $CWD
}

build_mac64() {
	# MAC OS X (64 only)
	echo "Building Mac binaries..."
	GOOS=darwin
	GOARCH=amd64
	LDFLAGS="-s -w"
	OUTPUT=$CWD/build/Mac/lesson-planner-prototype
	HARNESS=resource-align
	ZIP=lesson-planner-prototype-Mac.zip
	do_build
	#do_upx
	# do_shells
	do_zip
	echo "...all Mac binaries built..."
}


build_windows64() {
	# WINDOWS 64
	echo "Building Windows64 binaries..."
	GOOS=windows
	GOARCH=amd64
	LDFLAGS="-s -w"
	OUTPUT=$CWD/build/Win64/lesson-planner-prototype
	HARNESS=lesson-planner-prototype.exe
	ZIP=lesson-planner-prototype-Win64.zip
	do_build
	#do_upx
	# do_bats
	do_zip
	echo "...all Windows64 binaries built..."
}

build_windows32() {
	# WINDOWS 32
	echo "Building Windows32 binaries..."
	GOOS=windows
	GOARCH=386
	LDFLAGS="-s -w"
	OUTPUT=$CWD/build/Win32/lesson-planner-prototype
	# GNATS=nats-streaming-server.exe
	HARNESS=lesson-planner-prototype.exe
	ZIP=lesson-planner-prototype-Win32.zip
	do_build
	#do_upx
	# do_bats
	do_zip
	echo "...all Windows32 binaries built..."
}

build_linux64() {
	# LINUX 64
	echo "Building Linux64 binaries..."
	GOOS=linux
	GOARCH=amd64
	LDFLAGS="-s -w"
	OUTPUT=$CWD/build/Linux64/lesson-planner-prototype
	# GNATS=nats-streaming-server
	HARNESS=lesson-planner-prototype
	ZIP=lesson-planner-prototype-Linux64.zip
	do_build
	#do_goupx
	# do_shells
	do_zip
	echo "...all Linux64 binaries built..."
}

build_linux32() {
	# LINUX 32
	echo "Building Linux32 binaries..."
	GOOS=linux
	GOARCH=386
	LDFLAGS="-s -w"
	OUTPUT=$CWD/build/Linux32/lesson-planner-prototype
	# GNATS=nats-streaming-server
	HARNESS=lesson-planner-prototype
	ZIP=lesson-planner-prototype-Linux32.zip
	do_build
	#do_goupx
	# do_shells
	do_zip
	echo "...all Linux32 binaries built..."
}

# TODO ARM
# GOOS=linux GOARCH=arm GOARM=7 go build -o $CWD/build/LinuxArm7/go-nias/aggregator

if [ "$1" = "L32" ]
then
    build_linux32
elif [ "$1" = "L64"  ]
then
    build_linux64
elif [ "$1" = "W32"  ]
then
    build_windows32
elif [ "$1" = "W64"  ]
then
    build_windows64
elif [ "$1" = "M64"  ]
then
    build_mac64
else
    build_mac64
    build_windows64
    build_windows32
    build_linux64
    build_linux32
fi
