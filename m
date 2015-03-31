From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 14:00:07 +0200
Subject: [Buildroot] [git commit] hicolor-icon-theme: bump to version 0.15
Message-ID: <20150331121057.C665F81E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=704bab724164faefc33c61b54fe0e4c9d9ed269e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hicolor-icon-theme/hicolor-icon-theme.hash |    2 ++
 package/hicolor-icon-theme/hicolor-icon-theme.mk   |    3 ++-
 2 files changed, 4 insertions(+), 1 deletions(-)

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
 
