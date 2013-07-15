From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Jul 2013 11:19:17 -0300
Subject: [Buildroot] [PATCH 7/7] ed: bump to version 1.9
In-Reply-To: <1373897957-5938-1-git-send-email-gustavo@zacarias.com.ar>
References: <1373897957-5938-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1373897957-5938-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ed/ed.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 306e918..17de543 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.7
+ED_VERSION = 1.9
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)"
-- 
1.8.1.5
