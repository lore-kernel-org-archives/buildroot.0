From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 May 2013 15:09:57 +0200
Subject: [Buildroot] [git commit] udev: add license information
Message-ID: <20130508131702.3667799F4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5696a87376928651762aea01cd32f3fb3ff2d8aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/udev/udev.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index c55db71..1c97288 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -3,9 +3,12 @@
 # udev
 #
 #############################################################
+
 UDEV_VERSION = 182
 UDEV_SOURCE = udev-$(UDEV_VERSION).tar.bz2
 UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
+UDEV_LICENSE = GPLv2+
+UDEV_LICENSE_FILES = COPYING
 UDEV_INSTALL_STAGING = YES
 
 # mq_getattr is in librt
