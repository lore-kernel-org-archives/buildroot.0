From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Tue, 12 Apr 2016 19:48:24 +0200
Subject: [Buildroot] [PATCH] wine: Bump to version 1.8.2
Message-ID: <570D34E8.1050208@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumping to stable version 1.8.2

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/wine/wine.hash | 2 +-
 package/wine/wine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 31db6c0..b4eec49 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 149ad3daaf8593b36c5c061285df0ec2a25e20ea48c61323be91088c4d22ca97 wine-1.8.1.tar.bz2
+sha256 51624fadf0145e87f0c01e7ce8524ea1e8d9d360c3e8a86e78cd26a52ce55a6f wine-1.8.2.tar.bz2
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index fc04027..7587cb0 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WINE_VERSION = 1.8.1
+WINE_VERSION = 1.8.2
 WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
 WINE_SITE = https://dl.winehq.org/wine/source/1.8
 WINE_LICENSE = LGPLv2.1+
-- 
1.9.1
