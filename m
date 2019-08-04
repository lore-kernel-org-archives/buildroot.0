From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 18:59:10 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/glib-networking:
 drop host-intltool
Message-ID: <20190804201436.02B868CA74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df376cb2fe75997958569bc439f7572b2849daa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

intltool is not needed since version 2.49.90 and
https://gitlab.gnome.org/GNOME/glib-networking/commit/f539b7ebdb28bcf58cb2b6b86a15f33f563edaa8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 454d2a32eeaff512ef6e6e77c2c54f3688366154)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
