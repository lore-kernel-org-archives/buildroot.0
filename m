From: Ben Edwards <ben@artfuldodge.io>
Date: Thu, 05 Dec 2019 12:20:09 +0000
Subject: [Buildroot] Errors when compiling uboot for rpi 3
Message-ID: <1575547814.xk698xjfax.astroid@greyskull.none>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am very new to buildroot, so I am probably making some fundamental
mistake. I have configured buildroot with the raspberrypi3 defconfig and
then enabled uboot. The diff is

--- configs/raspberrypi3_defconfig	2019-12-04 19:27:02.700303546 +0000
+++ configs/raspberrypi3_defconfig	2019-12-05 11:15:07.073552770 +0000
@@ -1,37 +1,26 @@
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rpi_3"

I am using tag 2019.11 of buildroot. The uboot build log can be found @ https://pastebin.com/J7LagF5V

I've tried a few different bits like varying the uboot version etc, but
nothing seems to help, judging by the errors it seems to be some kind of
architecture mismatch, but I'm really new to the embedded space and
would appreciate all the help I can get.

Best,
Ben
