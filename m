From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Sep 2014 13:11:54 -0300
Subject: [Buildroot] [PATCH 1/2] libnpsr: bump to version 4.10.7
Message-ID: <1410365515-8328-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnspr/libnspr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 0e21d33..ba8a261 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.10.6
+LIBNSPR_VERSION = 4.10.7
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
1.8.5.5
