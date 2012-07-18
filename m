From: Daniel Mack <zonque@gmail.com>
Date: Wed, 18 Jul 2012 17:40:16 +0200
Subject: [Buildroot] [PATCH v2] package/usbutils: bump to version 006
In-Reply-To: <4FFB3CA9.8000303@mind.be>
References: <4FFB3CA9.8000303@mind.be>
Message-ID: <1342626016-11680-1-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, as the kernel.org archives are back up, use them as official site
again.

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 package/usbutils/usbutils.mk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index a242f93..0554682 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-USBUTILS_VERSION = 005
-USBUTILS_SITE = http://snapshot.debian.org/archive/debian/20111211T214105Z/pool/main/u/usbutils/
-USBUTILS_SOURCE = usbutils_$(USBUTILS_VERSION).orig.tar.gz
+USBUTILS_VERSION = 006
+USBUTILS_SITE = http://www.kernel.org/pub/linux/utils/usb/usbutils/
+USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.gz
 USBUTILS_DEPENDENCIES = host-pkg-config libusb
 USBUTILS_INSTALL_STAGING = YES
 # no configure in tarball
-- 
1.7.10.4
