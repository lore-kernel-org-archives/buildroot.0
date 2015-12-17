From: yann12 <douze.yann@gmail.com>
Date: Thu, 17 Dec 2015 06:58:17 -0800 (PST)
Subject: [Buildroot] Make error with Builroot
Message-ID: <1450364297578-120495.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I'm newbie whith Buildroot. 

I try to change the configuration of Builroot in order to install new Target
Packages (nano, openssh, ipkg, opkg, etc..) for the Linux distribution
intalled on a Altera SoC (Cortex A9 + FPGA).

I execute the *make menuconfig* on the Buildroot-2014.08, I add the
diff?rent Target Package that I need, (nano, openssh, ipkg, opkg)

When I execute the make command, I have a strange error, I reproduce the log
here  : 

Configuring NCURSES 5.9 ABI 5 (Thu Dec 17 16:08:00 CET 2015)
checking build system type... x86_64-unknown-linux-gnu
checking host system type... arm-buildroot-linux-gnueabihf
checking target system type... arm-buildroot-linux-gnueabihf
Configuring for linux-gnueabihf
checking for prefix... /usr
checking for arm-buildroot-linux-gnueabihf-gcc...
/home/novtech/Projects/me_buildroot-2014.08/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc
checking for C compiler default output... configure: error: C compiler
cannot create executables
make: ***
[/home/novtech/Projects/me_buildroot-2014.08/output/build/ncurses-5.9/.stamp_configured]
Error 77

And the 

It seems that he looks for arm-buildroot-linux-gnueabihf-gcc that doesn't
exist !

I was searching on Google for this kind of GCC Toolchain but I didn't find.
I already install and add to the path the Linaro toolchain for ARM processor
: gcc-linaro-arm-linux-gnueabihf-4.8-2014.04_linux

What can I do ?

Thanks for your help
Yann
What can 






--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Make-error-with-Builroot-tp120495.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
