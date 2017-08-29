From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 22:14:08 +0200
Subject: [Buildroot] [git commit] package/libphidget: fix upstream source URL
Message-ID: <20170829205008.DA62A81E89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc9cc4d7cfb7dcd4a450e6bafe010b19f4c85e78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libphidget/libphidget.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libphidget/libphidget.mk b/package/libphidget/libphidget.mk
index 23a320b..803d501 100644
--- a/package/libphidget/libphidget.mk
+++ b/package/libphidget/libphidget.mk
@@ -6,7 +6,7 @@
 
 LIBPHIDGET_VERSION = 2.1.8.20140319
 LIBPHIDGET_SOURCE = libphidget_$(LIBPHIDGET_VERSION).tar.gz
-LIBPHIDGET_SITE = http://www.phidgets.com/downloads/libraries
+LIBPHIDGET_SITE = https://www.phidgets.com/downloads/phidget21/libraries/linux/libphidget
 LIBPHIDGET_DEPENDENCIES = libusb
 LIBPHIDGET_CONF_OPTS = --disable-ldconfig
 LIBPHIDGET_INSTALL_STAGING = YES
