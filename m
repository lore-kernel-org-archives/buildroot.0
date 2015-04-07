From: Rohit Kumar <rkthebest@gmail.com>
Date: Tue, 7 Apr 2015 10:50:53 +0200
Subject: [Buildroot] Buildroot 2015.02-git-00861-gae5ed8b make error
Message-ID: <CABzetm3xjJzctWgto-SF83tABonMWTU=O72tRr4TDO1+_EYN0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

when i try to make buildroot it throws following error:

make
/usr/bin/make -j1  HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++"
silentoldconfig
make[1]: Entering directory `/home/rohit/Desktop/buildroot'
BR2_DEFCONFIG=''
KCONFIG_AUTOCONFIG=/home/rohit/Desktop/buildroot/output/build/buildroot-config/auto.conf
KCONFIG_AUTOHEADER=/home/rohit/Desktop/buildroot/output/build/buildroot-config/autoconf.h
KCONFIG_TRISTATE=/home/rohit/Desktop/buildroot/output/build/buildroot-config/tristate.config
BR2_CONFIG=/home/rohit/Desktop/buildroot/.config
BR2_EXTERNAL=support/dummy-external
/home/rohit/Desktop/buildroot/output/build/buildroot-config/conf
--silentoldconfig Config.in
make[1]: Leaving directory `/home/rohit/Desktop/buildroot'

You seem to have the current working directory in your
LD_LIBRARY_PATH environment variable. This doesn't work.
make: *** [core-dependencies] Error 1

my LD_LIBRARY PATH is
"/opt/ros/fuerte/lib:/opt/ros/fuerte/lib:"

what is worng here??

With Regards,

Rohit Kumar
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150407/218ae099/attachment.html>
