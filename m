From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Tue, 26 Jun 2018 22:27:15 +0200
Subject: [Buildroot] [PATCH] wine: Bump to version 3.0.2
Message-ID: <1530044835-4259-1-git-send-email-nerv@dawncrow.de>
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
index 176e0ee..0c4a14e 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 346a050aca5cd0d9978a655af11c30e68c201a58aea0c70d5e4c4f1b63c2fbec wine-3.0.tar.xz
+sha256 cad771375409e24244eab252da044306158af8a8bea4432e7ca81c1dc6b463ff wine-3.0.2.tar.xz
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index b6b3aae..36b3cfa 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WINE_VERSION = 3.0
+WINE_VERSION = 3.0.2
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
 WINE_SITE = https://dl.winehq.org/wine/source/3.0
 WINE_LICENSE = LGPL-2.1+
-- 
2.7.4
