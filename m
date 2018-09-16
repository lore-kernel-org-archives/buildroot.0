From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 10:22:50 +0200
Subject: [Buildroot] [git commit] wine: Bump to version 3.0.3
Message-ID: <20180916082245.2DDD3881A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85cd672aff2984fe8fe9b08722d01f752c1bf2c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
