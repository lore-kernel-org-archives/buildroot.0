From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 09:59:16 +0200
Subject: [Buildroot] [git commit] gvfs: remove --disable-gconf
Message-ID: <20181014075821.A0BD17FA3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=841f40545ad6b5f11a2490e6edbd433ebc5968f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gconf support has been dropped since 1.7.0:
https://gitlab.gnome.org/GNOME/gvfs/commit/e22dbb2aeadd3d45a93e702046bc9dc247368f4b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gvfs/gvfs.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index e272d5c1dc..d5f3682e2c 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -23,7 +23,6 @@ GVFS_CONF_OPTS = \
 	--disable-admin \
 	--disable-bash-completion \
 	--disable-cdda \
-	--disable-gconf \
 	--disable-gcr \
 	--disable-gdu \
 	--disable-goa \
