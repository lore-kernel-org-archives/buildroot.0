From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  3 Apr 2013 10:54:06 -0300
Subject: [Buildroot] [PATCH] libmicrohttpd: bump to version 0.9.26
Message-ID: <1364997246-20333-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmicrohttpd/libmicrohttpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index ab637de..b1bee53 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBMICROHTTPD_VERSION = 0.9.25
+LIBMICROHTTPD_VERSION = 0.9.26
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_INSTALL_STAGING = YES
 
-- 
1.8.1.5
