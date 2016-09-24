From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 24 Sep 2016 14:28:38 -0300
Subject: [Buildroot] [PATCH 5/9] adwaita-icon-theme: bump to version 3.22.0
In-Reply-To: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1474738122-18949-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/adwaita-icon-theme/adwaita-icon-theme.hash | 4 ++--
 package/adwaita-icon-theme/adwaita-icon-theme.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.hash b/package/adwaita-icon-theme/adwaita-icon-theme.hash
index a416e23..61b5f14 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.hash
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/3.20/adwaita-icon-theme-3.20.sha256sum
-sha256	7a0a887349f340dd644032f89d81264b694c4b006bd51af1c2c368d431e7ae35	adwaita-icon-theme-3.20.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/3.22/adwaita-icon-theme-3.22.0.sha256sum
+sha256	c18bf6e26087d9819a962c77288b291efab25d0419b73d909dd771716a45dcb7	adwaita-icon-theme-3.22.0.tar.xz
diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.mk b/package/adwaita-icon-theme/adwaita-icon-theme.mk
index 24ce350..b9ec0c0 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.mk
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-ADWAITA_ICON_THEME_VERSION = 3.20
-ADWAITA_ICON_THEME_SITE = http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION)
+ADWAITA_ICON_THEME_VERSION_MAJOR = 3.22
+ADWAITA_ICON_THEME_VERSION = $(ADWAITA_ICON_THEME_VERSION_MAJOR).0
+ADWAITA_ICON_THEME_SITE = http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION_MAJOR)
 ADWAITA_ICON_THEME_SOURCE = adwaita-icon-theme-$(ADWAITA_ICON_THEME_VERSION).tar.xz
 ADWAITA_ICON_THEME_LICENSE = LGPLv3 or CC-BY-SA-3.0
 ADWAITA_ICON_THEME_LICENSE_FILES = COPYING COPYING_LGPL COPYING_CCBYSA3
-- 
2.7.3
