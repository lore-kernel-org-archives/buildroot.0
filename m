From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Jul 2020 15:13:39 +0200
Subject: [Buildroot] [git commit] package/adwaita-icon-theme: bump version
 to 3.37.2
Message-ID: <20200705131037.865718612A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff881fa3770dc9e6c1df761ebd6b43546b717be2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/adwaita-icon-theme/adwaita-icon-theme.hash | 2 +-
 package/adwaita-icon-theme/adwaita-icon-theme.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.hash b/package/adwaita-icon-theme/adwaita-icon-theme.hash
index 0daef24db5..ce6acb8d9a 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.hash
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.hash
@@ -1,5 +1,5 @@
 # From http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/3.22/adwaita-icon-theme-3.22.0.sha256sum
-sha256  c18bf6e26087d9819a962c77288b291efab25d0419b73d909dd771716a45dcb7  adwaita-icon-theme-3.22.0.tar.xz
+sha256  a594e7440971f860cc61b1b8291be15ffc1b8dd06a9f11485a5a7faf189bcf6b  adwaita-icon-theme-3.37.2.tar.xz
 # locally computed
 sha256  51f83b2b4e9ed2beebc9b8eed2ecad29314a58ed8c5184b22ad8f9df703d3ce5  COPYING
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING_LGPL
diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.mk b/package/adwaita-icon-theme/adwaita-icon-theme.mk
index 8c9dec14f5..3950cfa636 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.mk
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ADWAITA_ICON_THEME_VERSION_MAJOR = 3.22
-ADWAITA_ICON_THEME_VERSION = $(ADWAITA_ICON_THEME_VERSION_MAJOR).0
+ADWAITA_ICON_THEME_VERSION_MAJOR = 3.37
+ADWAITA_ICON_THEME_VERSION = $(ADWAITA_ICON_THEME_VERSION_MAJOR).2
 ADWAITA_ICON_THEME_SITE = http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION_MAJOR)
 ADWAITA_ICON_THEME_SOURCE = adwaita-icon-theme-$(ADWAITA_ICON_THEME_VERSION).tar.xz
 ADWAITA_ICON_THEME_INSTALL_STAGING = YES
