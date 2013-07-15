From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Jul 2013 11:19:13 -0300
Subject: [Buildroot] [PATCH 3/7] libidn: bump to version 1.28
In-Reply-To: <1373897957-5938-1-git-send-email-gustavo@zacarias.com.ar>
References: <1373897957-5938-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1373897957-5938-3-git-send-email-gustavo@zacarias.com.ar>
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
index 44311eb..b2c3353 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.27
+LIBIDN_VERSION = 1.28
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
-- 
1.8.1.5
