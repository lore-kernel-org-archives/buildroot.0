From: Andreas Wetzel <andreas.wetzel@nanotronic.ch>
Date: Mon, 15 Apr 2013 10:31:24 +0200
Subject: [Buildroot] [PATCH 1/2] libwebsockets: bump to version
	1.22-chrome26-firefox18
Message-ID: <1366014685-31187-1-git-send-email-andreas.wetzel@nanotronic.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Andreas Wetzel <andreas.wetzel@nanotronic.ch>
---
 package/libwebsockets/libwebsockets.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index a3d8936..e1f1efa 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v1.1-chrome26-firefox18
+LIBWEBSOCKETS_VERSION = v1.22-chrome26-firefox18
 LIBWEBSOCKETS_SITE = http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot
 LIBWEBSOCKETS_LICENSE = LGPLv2.1
 LIBWEBSOCKETS_LICENSE_FILES = COPYING
-- 
1.7.10.4
