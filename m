From: FrAnKenStEiN MC <chfakht@gmail.com>
Date: Sun, 24 Jan 2016 16:12:47 +0000
Subject: [Buildroot] Error when running make linux-menuconfig
Message-ID: <CABi8WTzGpkv+g-cX=w9AXEOu4bz3901q9HPdKYfuMyMvH6B1ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have done
make raspberrypi_defconfig
make menu-config
make linux-menuconfig
i got :
PATH="/home/larbi/PFA/rootBuild/buildroot/output/host/bin:/home/larbi/PFA/rootBuild/buildroot/output/host/sbin:/home/larbi/PFA/rootBuild/buildroot/output/host/usr/bin:/home/larbi/PFA/rootBuild/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:
/usr/local/games"
BR_BINARIES_DIR=/home/larbi/PFA/rootBuild/buildroot/output/images
/usr/bin/make -j5 -C
/home/larbi/PFA/rootBuild/buildroot/output/build/linux-592503752b6951972f161f04280683c5af38d173
HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm
INSTALL_MOD_PATH=/home/larbi/PFA/rootBuild/buildroot/output/target
CROSS_COMPILE="/home/larbi/PFA/rootBuild/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-"
DEPMOD=/home/larbi/PFA/rootBuild/buildroot/output/host/sbin/depmod
bcmrpi_defconfig
make: ***
/home/larbi/PFA/rootBuild/buildroot/output/build/linux-592503752b6951972f161f04280683c5af38d173:
No such file or directory. Stop.
make[1]: ***
[/home/larbi/PFA/rootBuild/buildroot/output/build/linux-592503752b6951972f161f04280683c5af38d173/.config]
Error 2
make: *** [_all] Error 2

what's wrong ? thanks
?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160124/e12d3627/attachment.html>
