From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 23:47:11 +0200
Subject: [Buildroot] [git commit] wine: Bump to version 3.0.2
Message-ID: <20180626214425.998138353C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=751df64eb344eee6a583755de09d3d506ac2fe33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wine/wine.hash | 2 +-
 package/wine/wine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 176e0ee653..0c4a14e7d2 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 346a050aca5cd0d9978a655af11c30e68c201a58aea0c70d5e4c4f1b63c2fbec wine-3.0.tar.xz
+sha256 cad771375409e24244eab252da044306158af8a8bea4432e7ca81c1dc6b463ff wine-3.0.2.tar.xz
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index b6b3aae504..36b3cfa7b3 100644
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
