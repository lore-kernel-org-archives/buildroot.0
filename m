From: Tirant Lo Blanc <tirantloblanc77@yahoo.es>
Date: Thu, 14 Sep 2006 00:48:20 +0200 (CEST)
Subject: [Buildroot] Problems compiling Buildroot.
Message-ID: <20060913224820.84032.qmail@web27001.mail.ukl.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody,

I'm having problems compiling buildroot.

I got:

======================================
Checking build system dependencies:
sed works:                          Ok
GNU make version '3.81beta4':       Ok
gcc version '4.0.3':                Ok
which installed:                    Ok
bison installed:                    Ok
flex installed:                     Ok
gettext installed:                  Ok
Build system dependencies:          Ok

make -j1
CC=/home/victor/PFC/buildroot/build_arm/staging_dir/bin/arm-linux-uclibcgnueabi-gcc
CROSS_COMPILE="
/home/victor/PFC/buildroot/build_arm/staging_dir/bin/arm-linux-uclibcgnueabi-"
CROSS="/home/victor/PFC/build
root/build_arm/staging_dir/bin/arm-linux-uclibcgnueabi-"
PREFIX="/home/victor/PFC/buildroot/build_arm/root" \
                EXTRA_CFLAGS="-Os -pipe " -C
/home/victor/PFC/buildroot/build_arm/busybox
make[1]: se ingresa al directorio
`/home/victor/PFC/buildroot/build_arm/busybox'
  CC loginutils/login.o
/home/victor/PFC/buildroot/build_arm/busybox/loginutils/login.c:
In function `login_main':
/home/victor/PFC/buildroot/build_arm/busybox/loginutils/login.c:143:
warning: implicit declaration of functi on
`read_or_build_utent'
/home/victor/PFC/buildroot/build_arm/busybox/loginutils/login.c:145:
error: `utent' undeclared (first use in  this
function)
/home/victor/PFC/buildroot/build_arm/busybox/loginutils/login.c:145:
error: (Each undeclared identifier is r eported only
once
/home/victor/PFC/buildroot/build_arm/busybox/loginutils/login.c:145:
error: for each function it appears in. )
/home/victor/PFC/buildroot/build_arm/busybox/loginutils/login.c:204:
warning: implicit declaration of functi on
`write_utent'
make[2]: ***
[/home/victor/PFC/buildroot/build_arm/busybox/loginutils/login.o]
Error 1
make[1]: *** [_all] Error 2
make[1]: se sale del directorio
`/home/victor/PFC/buildroot/build_arm/busybox'
make: ***
[/home/victor/PFC/buildroot/build_arm/busybox/busybox]
Error 2
=========================================


Any idea? I have tried some daily snapshots and kept
getting compilation errors.

Thanks in advance, and excuse my poor English.


		
______________________________________________ 
LLama Gratis a cualquier PC del Mundo. 
Llamadas a fijos y m?viles desde 1 c?ntimo por minuto. 
http://es.voice.yahoo.com
