From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Sat, 15 Sep 2018 15:08:59 +0200
Subject: [Buildroot] [PATCH] wine: Bump to version 3.0.3
Message-ID: <20180915130859.8655-1-nerv@dawncrow.de>
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
index 0c4a14e7d2..855130c6fe 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 cad771375409e24244eab252da044306158af8a8bea4432e7ca81c1dc6b463ff wine-3.0.2.tar.xz
+sha256 eb645999ea6f6455a5275bf267e19a32497c8f5aac818ea40afe7c8c396a4da1 wine-3.0.3.tar.xz
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 36b3cfa7b3..fa672f0c7a 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WINE_VERSION = 3.0.2
+WINE_VERSION = 3.0.3
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
 WINE_SITE = https://dl.winehq.org/wine/source/3.0
 WINE_LICENSE = LGPL-2.1+
-- 
2.17.1
