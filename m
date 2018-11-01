From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 13:53:49 +0100
Subject: [Buildroot] [git commit] libnpth: bump to version 1.6
Message-ID: <20181101131712.21A4283C22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=614982a9111422236346244418fcc3e2369b16bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnpth/libnpth.hash | 4 +++-
 package/libnpth/libnpth.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libnpth/libnpth.hash b/package/libnpth/libnpth.hash
index 251d54badf..8d0b6bd547 100644
--- a/package/libnpth/libnpth.hash
+++ b/package/libnpth/libnpth.hash
@@ -1,5 +1,7 @@
 # Locally calculated after checking signature
-sha256 294a690c1f537b92ed829d867bee537e46be93fbd60b16c04630fbbfcd9db3c2  npth-1.5.tar.bz2
+# https://gnupg.org/ftp/gcrypt/npth/npth-1.6.tar.bz2.sig
+# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
+sha256 1393abd9adcf0762d34798dc34fdcf4d0d22a8410721e76f1e3afcd1daa4e2d1  npth-1.6.tar.bz2
 
 # Hash for license file:
 sha256 ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING.LIB
diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index 7b2eb2ae25..ecfef863f4 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNPTH_VERSION = 1.5
+LIBNPTH_VERSION = 1.6
 LIBNPTH_SOURCE = npth-$(LIBNPTH_VERSION).tar.bz2
 LIBNPTH_SITE = https://www.gnupg.org/ftp/gcrypt/npth
 LIBNPTH_LICENSE = LGPL-2.0+
