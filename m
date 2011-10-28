From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Oct 2011 14:44:39 +0200
Subject: [Buildroot] [git commit] udev: install in staging
Message-ID: <20111028124451.71DBD8F35A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de23afb030d5c762701ba83b6cde3ef4fdd02352
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

will provide libudev.h and libudev.so in staging

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/udev/udev.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 78c243f..1825396 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -6,6 +6,7 @@
 UDEV_VERSION = 173
 UDEV_SOURCE = udev-$(UDEV_VERSION).tar.bz2
 UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
+UDEV_INSTALL_STAGING = YES
 
 UDEV_CONF_OPT =			\
 	--sbindir=/sbin		\
