From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  5 Jan 2016 10:46:40 -0300
Subject: [Buildroot] [PATCH] cantarell: bump to version 0.0.20
Message-ID: <1452001600-11151-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cantarell/cantarell.hash | 4 ++--
 package/cantarell/cantarell.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cantarell/cantarell.hash b/package/cantarell/cantarell.hash
index 9597550..67428d8 100644
--- a/package/cantarell/cantarell.hash
+++ b/package/cantarell/cantarell.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.19.sha256sum
-sha256	c7f975ef3d5cf0ed409636c59d069260783683c47ba1289ac3e66a98446e46ae	cantarell-fonts-0.0.19.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.20.sha256sum
+sha256	fb78a5cb6bdcfc464b763a030186c818080860107283bff8adcbb2d084f8f8de	cantarell-fonts-0.0.20.tar.xz
diff --git a/package/cantarell/cantarell.mk b/package/cantarell/cantarell.mk
index 008e1e6..a82b758 100644
--- a/package/cantarell/cantarell.mk
+++ b/package/cantarell/cantarell.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CANTARELL_VERSION_MAJOR = 0.0
-CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).19
+CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).20
 CANTARELL_SITE = http://ftp.gnome.org/pub/gnome/sources/cantarell-fonts/$(CANTARELL_VERSION_MAJOR)
 CANTARELL_SOURCE = cantarell-fonts-$(CANTARELL_VERSION).tar.xz
 CANTARELL_DEPENDENCIES = host-pkgconf
-- 
2.4.10
