From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 17:51:07 +0200
Subject: [Buildroot] [git commit branch/next] wine: Bump to version 2.0.1
Message-ID: <20170511155115.CA8B5828F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d43155294e658b6d9c6b616d2d4f0856fdccf2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wine/wine.hash | 2 +-
 package/wine/wine.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index b4b67cd..3490c7e 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 9756f5a2129b6a83ba701e546173cbff86caa671b0af73eb8f72c03b20c066c6 wine-2.0.tar.bz2
+sha256 6cfb4eaae566dc7afb7ac0f1f2db2c0d69969952acab0debf084ee8f7b071583 wine-2.0.1.tar.xz
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 5c47186..68ebd48 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WINE_VERSION = 2.0
-WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
+WINE_VERSION = 2.0.1
+WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
 WINE_SITE = https://dl.winehq.org/wine/source/2.0
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
