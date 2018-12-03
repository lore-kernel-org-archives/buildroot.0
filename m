From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 13:31:18 +0100
Subject: [Buildroot] [git commit] package/wine: bump to version 3.0.4
Message-ID: <20181203122752.EBE9B8A4E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ec023b4fcb8dcae38afb76deaddf0f62aaeb52b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
