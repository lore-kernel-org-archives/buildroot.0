From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:26:32 +0200
Subject: [Buildroot] [git commit] gtk2-theme-hicolor: add license information
Message-ID: <20140701224921.B09719D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0525017d5b8be7f256bf0abd468ec5b4fcefd82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gtk2-theme-hicolor/gtk2-theme-hicolor.mk       |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
