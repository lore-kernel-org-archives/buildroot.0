From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Sun,  2 Dec 2018 18:32:50 +0100
Subject: [Buildroot] [PATCH] wine: Bump to version 3.0.4
Message-ID: <20181202173250.663-1-nerv@dawncrow.de>
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
index 855130c6fe..ba007142e8 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 eb645999ea6f6455a5275bf267e19a32497c8f5aac818ea40afe7c8c396a4da1 wine-3.0.3.tar.xz
+sha256 d45a88edbe7db363e297cacedc94e66df3464504a01c2eccf04f518066a6fb0c wine-3.0.4.tar.xz
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index fa672f0c7a..dc559efd95 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WINE_VERSION = 3.0.3
+WINE_VERSION = 3.0.4
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
 WINE_SITE = https://dl.winehq.org/wine/source/3.0
 WINE_LICENSE = LGPL-2.1+
-- 
2.17.1
