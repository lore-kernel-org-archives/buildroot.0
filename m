From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 13 Oct 2018 15:28:42 +0200
Subject: [Buildroot] [PATCH 1/2] gvfs: remove --disable-gconf
Message-ID: <20181013132843.21702-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gconf support has been dropped since 1.7.0:
https://gitlab.gnome.org/GNOME/gvfs/commit/e22dbb2aeadd3d45a93e702046bc9dc247368f4b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gvfs/gvfs.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 7110e39083..6b20fd9b9a 100644
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
-- 
2.17.1
