From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 6 Oct 2011 15:35:32 -0500
Subject: [Buildroot] [PATCH] libevent: bump version to 2.0.14
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DCFEC78@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Released 2011-08-31.  Mostly bugfixes.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 31122fe..76fb627 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -3,9 +3,9 @@
 # libevent
 #
 #############################################################
-LIBEVENT_VERSION = 2.0.13
+LIBEVENT_VERSION = 2.0.14
 LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
-LIBEVENT_SITE = http://monkey.org/~provos/
+LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
 
 LIBEVENT_AUTORECONF = NO
 LIBEVENT_INSTALL_STAGING = YES
