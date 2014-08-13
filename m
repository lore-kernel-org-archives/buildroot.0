From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 13 Aug 2014 14:01:06 -0300
Subject: [Buildroot] [PATCH] libidn: bump to version 1.29
Message-ID: <1407949266-5110-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libidn/libidn.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 7d20edf..7d327d1 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.28
+LIBIDN_VERSION = 1.29
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
-- 
1.8.5.5
