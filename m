From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Wed,  1 Oct 2014 23:11:57 +0200
Subject: [Buildroot] [PATCH 3/3] package/libshairplay: bump git snapshot
Message-ID: <1412197917-16535-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/libshairplay/libshairplay.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libshairplay/libshairplay.mk b/package/libshairplay/libshairplay.mk
index fc397d7..35bbeac 100644
--- a/package/libshairplay/libshairplay.mk
+++ b/package/libshairplay/libshairplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSHAIRPLAY_VERSION = 139d5ef55564514c31f02dd82cef91236c9ff523
+LIBSHAIRPLAY_VERSION = 64d59e3087f829006d091fa0d114efb50972a2bf
 LIBSHAIRPLAY_SITE = $(call github,juhovh,shairplay,$(LIBSHAIRPLAY_VERSION))
 LIBSHAIRPLAY_INSTALL_STAGING = YES
 LIBSHAIRPLAY_AUTORECONF = YES
-- 
2.1.2
