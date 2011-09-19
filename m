From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:53:24 +0200
Subject: [Buildroot] [PATCH 21/21] gtk2-theme-hicolor: remove useless
	definitions
In-Reply-To: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
Message-ID: <404badf13007c81b5be04e863a34d5d5f8ca0939.1316464690.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../gtk2-theme-hicolor/gtk2-theme-hicolor.mk       |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
index 15fc8e2..055205c 100644
--- a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
+++ b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
@@ -6,12 +6,6 @@
 GTK2_THEME_HICOLOR_VERSION = 0.10
 GTK2_THEME_HICOLOR_SOURCE = hicolor-icon-theme-$(GTK2_THEME_HICOLOR_VERSION).tar.gz
 GTK2_THEME_HICOLOR_SITE = http://icon-theme.freedesktop.org/releases/
-GTK2_THEME_HICOLOR_INSTALL_STAGING = NO
-GTK2_THEME_HICOLOR_INSTALL_TARGET = YES
-
-GTK2_THEME_HICOLOR_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-        --build=$(GNU_HOST_NAME) --prefix=/usr \
-        --includedir=/usr/include
 
 GTK2_THEME_HICOLOR_DEPENDENCIES = libgtk2
 
-- 
1.7.4.1
