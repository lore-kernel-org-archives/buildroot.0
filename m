From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 16:11:38 +0200
Subject: [Buildroot] [git commit] package/glib-networking: drop host-intltool
Message-ID: <20190714141051.ADA4A812E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=454d2a32eeaff512ef6e6e77c2c54f3688366154
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

intltool is not needed since version 2.49.90 and
https://gitlab.gnome.org/GNOME/glib-networking/commit/f539b7ebdb28bcf58cb2b6b86a15f33f563edaa8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glib-networking/glib-networking.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 325cbcf8ad..163f1b0dd2 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -12,7 +12,6 @@ GLIB_NETWORKING_INSTALL_STAGING = YES
 GLIB_NETWORKING_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf \
-	host-intltool \
 	libglib2 \
 	gnutls
 
