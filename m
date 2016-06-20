From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Jun 2016 10:56:44 -0300
Subject: [Buildroot] [PATCH] adwaita-icon-theme: install to staging
Message-ID: <1466431004-11502-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's required for evince to find the pkgconfig file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/adwaita-icon-theme/adwaita-icon-theme.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.mk b/package/adwaita-icon-theme/adwaita-icon-theme.mk
index 24ce350..6851f4d 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.mk
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.mk
@@ -7,6 +7,7 @@
 ADWAITA_ICON_THEME_VERSION = 3.20
 ADWAITA_ICON_THEME_SITE = http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION)
 ADWAITA_ICON_THEME_SOURCE = adwaita-icon-theme-$(ADWAITA_ICON_THEME_VERSION).tar.xz
+ADWAITA_ICON_THEME_INSTALL_STAGING = YES
 ADWAITA_ICON_THEME_LICENSE = LGPLv3 or CC-BY-SA-3.0
 ADWAITA_ICON_THEME_LICENSE_FILES = COPYING COPYING_LGPL COPYING_CCBYSA3
 ADWAITA_ICON_THEME_DEPENDENCIES = host-intltool host-libgtk3
-- 
2.7.3
