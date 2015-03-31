From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Mar 2015 08:39:27 -0300
Subject: [Buildroot] [PATCH] hicolor-icon-theme: bump to version 0.15
Message-ID: <1427801967-31098-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hicolor-icon-theme/hicolor-icon-theme.hash | 2 ++
 package/hicolor-icon-theme/hicolor-icon-theme.mk   | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/hicolor-icon-theme/hicolor-icon-theme.hash

diff --git a/package/hicolor-icon-theme/hicolor-icon-theme.hash b/package/hicolor-icon-theme/hicolor-icon-theme.hash
new file mode 100644
index 0000000..522dcfc
--- /dev/null
+++ b/package/hicolor-icon-theme/hicolor-icon-theme.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	9cc45ac3318c31212ea2d8cb99e64020732393ee7630fa6c1810af5f987033cc	hicolor-icon-theme-0.15.tar.xz
diff --git a/package/hicolor-icon-theme/hicolor-icon-theme.mk b/package/hicolor-icon-theme/hicolor-icon-theme.mk
index cf4578e..5e00074 100644
--- a/package/hicolor-icon-theme/hicolor-icon-theme.mk
+++ b/package/hicolor-icon-theme/hicolor-icon-theme.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-HICOLOR_ICON_THEME_VERSION = 0.13
+HICOLOR_ICON_THEME_VERSION = 0.15
 HICOLOR_ICON_THEME_SITE = http://icon-theme.freedesktop.org/releases
+HICOLOR_ICON_THEME_SOURCE = hicolor-icon-theme-$(HICOLOR_ICON_THEME_VERSION).tar.xz
 HICOLOR_ICON_THEME_LICENSE = GPLv2
 HICOLOR_ICON_THEME_LICENSE_FILES = COPYING
 
-- 
2.0.5
