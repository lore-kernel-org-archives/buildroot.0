From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Feb 2016 12:50:15 -0300
Subject: [Buildroot] [PATCH] cantarell: bump to version 0.21
Message-ID: <1455637815-9630-1-git-send-email-gustavo@zacarias.com.ar>
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
index d776647..5d8284d 100644
--- a/package/cantarell/cantarell.hash
+++ b/package/cantarell/cantarell.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.20.1.sha256sum
-sha256	0f933516f3270fb7307d9c2e26e4703b403608c5cc9da3127cba4395bcd4ec91	cantarell-fonts-0.0.20.1.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.21.sha256sum
+sha256	2d3e925574648f0902c61975f84acac445ee9cda826280644bdf772960b46e85	cantarell-fonts-0.0.21.tar.xz
diff --git a/package/cantarell/cantarell.mk b/package/cantarell/cantarell.mk
index aaad85a..c677c78 100644
--- a/package/cantarell/cantarell.mk
+++ b/package/cantarell/cantarell.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CANTARELL_VERSION_MAJOR = 0.0
-CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).20.1
+CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).21
 CANTARELL_SITE = http://ftp.gnome.org/pub/gnome/sources/cantarell-fonts/$(CANTARELL_VERSION_MAJOR)
 CANTARELL_SOURCE = cantarell-fonts-$(CANTARELL_VERSION).tar.xz
 CANTARELL_DEPENDENCIES = host-pkgconf
-- 
2.4.10
