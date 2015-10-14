From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 22:28:33 +0200
Subject: [Buildroot] [git commit] adwaita-icon-theme: bump to version 3.18.0
Message-ID: <20151014202845.E1865818A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=82b20b54bb5b64e8beb3413ed9fc44d898e3fb7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also switch from ftp to http, it's better for firewall-laden places.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/adwaita-icon-theme/adwaita-icon-theme.hash |    4 ++--
 package/adwaita-icon-theme/adwaita-icon-theme.mk   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.hash b/package/adwaita-icon-theme/adwaita-icon-theme.hash
index 1662ab9..14e88ed 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.hash
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.hash
@@ -1,2 +1,2 @@
-# From ftp://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/3.14/adwaita-icon-theme-3.14.0.sha256sum
-sha256	afacb6025a18be007e33a9663b92cee9d2745279bb00107a68e09b2806f9541f  adwaita-icon-theme-3.14.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/3.18/adwaita-icon-theme-3.18.0.sha256sum
+sha256	5e9ce726001fdd8ee93c394fdc3cdb9e1603bbed5b7c62df453ccf521ec50e58	adwaita-icon-theme-3.18.0.tar.xz
diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.mk b/package/adwaita-icon-theme/adwaita-icon-theme.mk
index f9a6b50..cf39d04 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.mk
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ADWAITA_ICON_THEME_VERSION_MAJOR = 3.14
+ADWAITA_ICON_THEME_VERSION_MAJOR = 3.18
 ADWAITA_ICON_THEME_VERSION = $(ADWAITA_ICON_THEME_VERSION_MAJOR).0
-ADWAITA_ICON_THEME_SITE = ftp://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION_MAJOR)
+ADWAITA_ICON_THEME_SITE = http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION_MAJOR)
 ADWAITA_ICON_THEME_SOURCE = adwaita-icon-theme-$(ADWAITA_ICON_THEME_VERSION).tar.xz
 ADWAITA_ICON_THEME_LICENSE = LGPLv3 or CC-BY-SA-3.0
 ADWAITA_ICON_THEME_LICENSE_FILES = COPYING COPYING_LGPL COPYING_CCBYSA3
