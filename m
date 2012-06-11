From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 11 Jun 2012 22:16:20 +0200
Subject: [Buildroot] [git commit] libmodbus: bump to 3.0.3
Message-ID: <20120611202841.B2F1896E8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aae26bb872384559df1b211ef0a96ea50c7a1fe8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmodbus/libmodbus.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 4dcfe23..d45bc92 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -3,9 +3,8 @@
 # libmodbus
 #
 #############################################################
-LIBMODBUS_VERSION = 3.0.2
+LIBMODBUS_VERSION = 3.0.3
 LIBMODBUS_SITE = http://github.com/downloads/stephane/libmodbus
-LIBMODBUS_SOURCE = libmodbus-$(LIBMODBUS_VERSION).tar.gz
 LIBMODBUS_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
