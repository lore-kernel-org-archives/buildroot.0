From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 08:21:53 +0200
Subject: [Buildroot] [git commit] package/gsettings-desktop-schemas: bump to
 version 3.36.1
Message-ID: <20200617062110.51D8B84274@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea3c66c909d8f29cc1666b8ee8c33917290c90d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash fle (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash | 6 +++---
 package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
index c37b7377de..d530517cd1 100644
--- a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
@@ -1,5 +1,5 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/gsettings-desktop-schemas/3.33/gsettings-desktop-schemas-3.33.1.sha256sum
-sha256	bd337f13955856140fdbd3073c56d4adca20333f8bdac41e429c3dca4730cdff	gsettings-desktop-schemas-3.33.1.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/gsettings-desktop-schemas/3.36/gsettings-desktop-schemas-3.36.1.sha256sum
+sha256  004bdbe43cf8290f2de7d8537e14d8957610ca479a4fa368e34dbd03f03ec9d9  gsettings-desktop-schemas-3.36.1.tar.xz
 
 # Hash for license file
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
index 98d16745b2..8573c75fde 100644
--- a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR = 3.33
+GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR = 3.36
 GSETTINGS_DESKTOP_SCHEMAS_VERSION = $(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR).1
 GSETTINGS_DESKTOP_SCHEMAS_SOURCE = gsettings-desktop-schemas-$(GSETTINGS_DESKTOP_SCHEMAS_VERSION).tar.xz
 GSETTINGS_DESKTOP_SCHEMAS_SITE = http://ftp.gnome.org/pub/gnome/sources/gsettings-desktop-schemas/$(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR)
