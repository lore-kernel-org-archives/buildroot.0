From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:47 -0300
Subject: [Buildroot] [PATCH 19/53] gtk2-theme-hicolor: add license
	information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-19-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
index ae677f7..24c5959 100644
--- a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
+++ b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
@@ -7,7 +7,8 @@
 GTK2_THEME_HICOLOR_VERSION = 0.10
 GTK2_THEME_HICOLOR_SOURCE = hicolor-icon-theme-$(GTK2_THEME_HICOLOR_VERSION).tar.gz
 GTK2_THEME_HICOLOR_SITE = http://icon-theme.freedesktop.org/releases/
-
 GTK2_THEME_HICOLOR_DEPENDENCIES = libgtk2
+GTK2_THEME_HICOLOR_LICENSE = GPLv2
+GTK2_THEME_HICOLOR_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.5.5
