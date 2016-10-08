From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Sat,  8 Oct 2016 15:41:54 +0200
Subject: [Buildroot] [PATCH] wine: Bump to version 1.8.5
Message-ID: <1475934114-30242-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/wine/wine.hash | 2 +-
 package/wine/wine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index d58ac02..0f6b9d3 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 515d10439777a4816fe5b0a0fc9a4ce498a2ecfd23eba0c25dc00f3d6c805079 wine-1.8.4.tar.bz2
+sha256 dee2a4959e5f90a89aaf04566c23f2926e9590f8968ea662afd81947fdb6f6d6 wine-1.8.5.tar.bz2
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index aceea35..d9a0ecf 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WINE_VERSION = 1.8.4
+WINE_VERSION = 1.8.5
 WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
 WINE_SITE = https://dl.winehq.org/wine/source/1.8
 WINE_LICENSE = LGPLv2.1+
-- 
2.7.4
