From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Sep 2014 13:11:55 -0300
Subject: [Buildroot] [PATCH 2/2] libnss: bump to version 3.17
In-Reply-To: <1410365515-8328-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410365515-8328-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1410365515-8328-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnss/libnss.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index ac5f72f..a822726 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.16.3
+LIBNSS_VERSION = 3.17
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
1.8.5.5
