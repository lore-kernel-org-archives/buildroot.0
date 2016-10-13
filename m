From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Oct 2016 22:13:52 -0300
Subject: [Buildroot] [PATCH 1/8] gsettings-desktop-schemas: bump to version
	3.22.0
Message-ID: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash | 4 ++--
 package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
index 7fed553..05ec7a4 100644
--- a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/gsettings-desktop-schemas/3.20/gsettings-desktop-schemas-3.20.0.sha256sum
-sha256	55a41b533c0ab955e0a36a84d73829451c88b027d8d719955d8f695c35c6d9c1	gsettings-desktop-schemas-3.20.0.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/gsettings-desktop-schemas/3.22/gsettings-desktop-schemas-3.22.0.sha256sum
+sha256	0f06c7ba34c3a99e4d58b10889496133c9aaad6698ea2d8405d481c7f1a7eae1	gsettings-desktop-schemas-3.22.0.tar.xz
diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
index 04ad2e0..7fa6181 100644
--- a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR = 3.20
+GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR = 3.22
 GSETTINGS_DESKTOP_SCHEMAS_VERSION = $(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR).0
 GSETTINGS_DESKTOP_SCHEMAS_SOURCE = gsettings-desktop-schemas-$(GSETTINGS_DESKTOP_SCHEMAS_VERSION).tar.xz
 GSETTINGS_DESKTOP_SCHEMAS_SITE = http://ftp.gnome.org/pub/gnome/sources/gsettings-desktop-schemas/$(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR)
-- 
2.7.3
