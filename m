From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Mar 2021 23:42:59 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/gvfs: add
 GVFS_CPE_ID_VENDOR
Message-ID: <20210326222258.EB1A28909E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0438a071b185b23ee4d69c2572b13a21ff483ea4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:gnome:gvfs is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Agvfs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7062e183a2742651bc88af0149470fed0d95e3f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gvfs/gvfs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index c5104e8dbf..fc77e8e1aa 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -19,6 +19,7 @@ GVFS_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES)
 GVFS_LICENSE = LGPL-2.0+
 GVFS_LICENSE_FILES = COPYING
+GVFS_CPE_ID_VENDOR = gnome
 
 GVFS_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
