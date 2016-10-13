From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Oct 2016 22:13:53 -0300
Subject: [Buildroot] [PATCH 2/8] adwaita-icon-theme: install to staging
In-Reply-To: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
References: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1476321239-13894-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is required for the upcoming evince package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/adwaita-icon-theme/adwaita-icon-theme.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.mk b/package/adwaita-icon-theme/adwaita-icon-theme.mk
index b9ec0c0..fdf66c8 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.mk
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.mk
@@ -8,6 +8,7 @@ ADWAITA_ICON_THEME_VERSION_MAJOR = 3.22
 ADWAITA_ICON_THEME_VERSION = $(ADWAITA_ICON_THEME_VERSION_MAJOR).0
 ADWAITA_ICON_THEME_SITE = http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION_MAJOR)
 ADWAITA_ICON_THEME_SOURCE = adwaita-icon-theme-$(ADWAITA_ICON_THEME_VERSION).tar.xz
+ADWAITA_ICON_THEME_INSTALL_STAGING = YES
 ADWAITA_ICON_THEME_LICENSE = LGPLv3 or CC-BY-SA-3.0
 ADWAITA_ICON_THEME_LICENSE_FILES = COPYING COPYING_LGPL COPYING_CCBYSA3
 ADWAITA_ICON_THEME_DEPENDENCIES = host-intltool host-libgtk3
-- 
2.7.3
