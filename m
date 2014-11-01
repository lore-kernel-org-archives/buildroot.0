From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 20:04:55 +0100
Subject: [Buildroot] [git commit] adwaita-icon-theme: add missing dependency
	on host-intltool
Message-ID: <20141101190644.ED9CCB2B32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0bc79d61601222d1ea005ffb0670d3222912638
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/2d7/2d74a4b7ea7c679a4879e209b42df75acbab690c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/adwaita-icon-theme/adwaita-icon-theme.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.mk b/package/adwaita-icon-theme/adwaita-icon-theme.mk
index af49dc0..e273d90 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.mk
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.mk
@@ -10,5 +10,6 @@ ADWAITA_ICON_THEME_SITE = ftp://ftp.gnome.org/pub/gnome/sources/adwaita-icon-the
 ADWAITA_ICON_THEME_SOURCE = adwaita-icon-theme-$(ADWAITA_ICON_THEME_VERSION).tar.xz
 ADWAITA_ICON_THEME_LICENSE = LGPLv3 or CC-BY-SA-3.0
 ADWAITA_ICON_THEME_LICENSE_FILES = COPYING COPYING_LGPL COPYING_CCBYSA3
+ADWAITA_ICON_THEME_DEPENDENCIES = host-intltool
 
 $(eval $(autotools-package))
