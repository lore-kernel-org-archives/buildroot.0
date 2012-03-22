From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 23 Mar 2012 00:20:50 +0100
Subject: [Buildroot] [git commit] udev: bump to 182
Message-ID: <20120322232116.C8C219693C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6496d03156784646c501974b4aa2c89a7930f444
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/udev/udev.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index d445a2f..85f6254 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -3,7 +3,7 @@
 # udev
 #
 #############################################################
-UDEV_VERSION = 181
+UDEV_VERSION = 182
 UDEV_SOURCE = udev-$(UDEV_VERSION).tar.bz2
 UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
 UDEV_INSTALL_STAGING = YES
