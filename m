From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 19:52:05 +0200
Subject: [Buildroot] [PATCH 12/28] package/libshairplay: bump version
In-Reply-To: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465149141-15774-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libshairplay/libshairplay.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libshairplay/libshairplay.mk b/package/libshairplay/libshairplay.mk
index 35bbeac..4bdd1a0 100644
--- a/package/libshairplay/libshairplay.mk
+++ b/package/libshairplay/libshairplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSHAIRPLAY_VERSION = 64d59e3087f829006d091fa0d114efb50972a2bf
+LIBSHAIRPLAY_VERSION = ce80e005908f41d0e6fde1c4a21e9cb8ee54007b
 LIBSHAIRPLAY_SITE = $(call github,juhovh,shairplay,$(LIBSHAIRPLAY_VERSION))
 LIBSHAIRPLAY_INSTALL_STAGING = YES
 LIBSHAIRPLAY_AUTORECONF = YES
-- 
2.8.1
