From: rscr <rafacrespiramon@gmail.com>
Date: Fri, 24 Jan 2020 04:21:10 -0600 (CST)
Subject: [Buildroot] QtWebEngine on RPI 0 W
Message-ID: <1579861270269-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

I have built a custom image for RPI 0 W. Now I need QT with QtWebEngine. 

- As I am using  toolchain *arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf*, I
have to use Qt 5.6.3 because it is supported by GCC > 4.8

ISSUE:

When trying to build the image, I got building failed. Some of the errors
are:

Running configuration tests (phase 1)...
/home/ibercomp/rcr/projects/cp4/buildroot/output/host/bin/arm-linux-gnueabihf-g++
-c -fvisibility=hidden fvisibility.c
Symbol visibility control enabled.
collect2: fatal error: cannot find 'ld'
compilation terminated
...
Makefile:192: recipe for target 'db2.o' failed
...
Makefile:192: recipe for target 'ibase.o' failed
...
Makefile:195: recipe for target 'icu.o' failed
make[2]: *** [icu.o] Error 1
ICU disabled.
The ICU library support cannot be enabled.


Find attached my defconfig: cp4_defconfig.cp4_defconfig
<http://buildroot-busybox.2317881.n4.nabble.com/file/t2824/cp4_defconfig.cp4_defconfig>  

*Any idea of what I've been missing?*

It is possible having Qt 5.11.3 and once built the image, add a QtWebEngine
version supported by my gcc?  

Kind Regards, 

Rafa





--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
