From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Thu, 11 May 2017 17:41:58 +0200
Subject: [Buildroot] [PATCH] wine: Bump to version 2.0.1
Message-ID: <1494517318-12795-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
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
-- 
2.7.4
