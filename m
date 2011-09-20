From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Sep 2011 22:57:05 +0200
Subject: [Buildroot] [git commit] gtk2-theme-hicolor: remove useless
	definitions
Message-ID: <20110920205935.DAF748D72D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a323d0eeabab7f86954d0b5e58d3d75acc6b6fda
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gtk2-theme-hicolor/gtk2-theme-hicolor.mk       |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
index ac2eaef..8aac899 100644
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
 
