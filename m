From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 30 Oct 2018 13:40:22 +0200
Subject: [Buildroot] [PATCH 4/6] libnpth: bump to version 1.6
In-Reply-To: <df3569102a6ce73ffbde85da1e4ccc7d877ee1b6.1540899624.git.baruch@tkos.co.il>
References: <df3569102a6ce73ffbde85da1e4ccc7d877ee1b6.1540899624.git.baruch@tkos.co.il>
Message-ID: <d0c4384bd4a1a2a5f53c202abc57658f03fb673d.1540899624.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libnpth/libnpth.hash | 4 +++-
 package/libnpth/libnpth.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libnpth/libnpth.hash b/package/libnpth/libnpth.hash
index 251d54badfca..8d0b6bd54764 100644
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
index 7b2eb2ae258c..ecfef863f41f 100644
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
-- 
2.19.1
