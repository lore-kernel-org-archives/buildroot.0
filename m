From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Sep 2019 21:56:37 +0200
Subject: [Buildroot] [git commit] package/wine: bump to version 4.0.2
Message-ID: <20190913200558.075F48E101@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ad978b196cef8e43d3e2a0339f7b09f1ad338e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wine/wine.hash | 2 +-
 package/wine/wine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 6993d6ecbc..385d146a24 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 6736cdee95b2b8bb021ec0c19497ed8cad5ae2c8bfdb7ab5dc687ff92a480d4d wine-4.0.tar.xz
+sha256 994050692f8417ee206daafa5fc0ff810cc9392ffda1786ac0f0fb0cf74dbd74 wine-4.0.2.tar.xz
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 78fa860ecf..5cc1ba0566 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WINE_VERSION = 4.0
+WINE_VERSION = 4.0.2
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
 WINE_SITE = https://dl.winehq.org/wine/source/4.0
 WINE_LICENSE = LGPL-2.1+
