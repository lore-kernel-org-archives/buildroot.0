From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:12:50 +0200
Subject: [Buildroot] [git commit] package/hicolor-icon-theme: bump to
 version 0.17
Message-ID: <20200919190345.CED0185E76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ded85763061e27b8d4a53f24926cc12f8309948a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hicolor-icon-theme/hicolor-icon-theme.hash | 2 +-
 package/hicolor-icon-theme/hicolor-icon-theme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hicolor-icon-theme/hicolor-icon-theme.hash b/package/hicolor-icon-theme/hicolor-icon-theme.hash
index b1dcaf4ae8..ec9635f05a 100644
--- a/package/hicolor-icon-theme/hicolor-icon-theme.hash
+++ b/package/hicolor-icon-theme/hicolor-icon-theme.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9cc45ac3318c31212ea2d8cb99e64020732393ee7630fa6c1810af5f987033cc  hicolor-icon-theme-0.15.tar.xz
+sha256  317484352271d18cbbcfac3868eab798d67fff1b8402e740baa6ff41d588a9d8  hicolor-icon-theme-0.17.tar.xz
 sha256  b0a64377d4ee87b7dbcf418ce4fb33ec3b2d7081b6732890e4af06b8118c4526  COPYING
diff --git a/package/hicolor-icon-theme/hicolor-icon-theme.mk b/package/hicolor-icon-theme/hicolor-icon-theme.mk
index dec75c15c4..088aecf31c 100644
--- a/package/hicolor-icon-theme/hicolor-icon-theme.mk
+++ b/package/hicolor-icon-theme/hicolor-icon-theme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HICOLOR_ICON_THEME_VERSION = 0.15
+HICOLOR_ICON_THEME_VERSION = 0.17
 HICOLOR_ICON_THEME_SITE = http://icon-theme.freedesktop.org/releases
 HICOLOR_ICON_THEME_SOURCE = hicolor-icon-theme-$(HICOLOR_ICON_THEME_VERSION).tar.xz
 HICOLOR_ICON_THEME_LICENSE = GPL-2.0
