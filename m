From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 23:33:54 +0200
Subject: [Buildroot] [git commit branch/next] package/atk: bump to version
 2.36.0
Message-ID: <20200509211851.643E58F17E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8172ffe3fc3327edf7255ffc53a0d94112e5cf50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/atk/atk.hash | 6 +++---
 package/atk/atk.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/atk/atk.hash b/package/atk/atk.hash
index 8c1bad5b1a..2e7c3b5fec 100644
--- a/package/atk/atk.hash
+++ b/package/atk/atk.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.33/atk-2.33.3.sha256sum
-sha256 532d1081e87b9f0a8d71733101e791818442fa1896531621d1aecc189e1a4ffe atk-2.33.3.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/atk/2.36/atk-2.36.0.sha256sum
+sha256  fb76247e369402be23f1f5c65d38a9639c1164d934e40f6a9cf3c9e96b652788  atk-2.36.0.tar.xz
 
 # Hash for license file
-sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5 COPYING
+sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index a16143d2c0..dfeb4de8b2 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.33
-ATK_VERSION = $(ATK_VERSION_MAJOR).3
+ATK_VERSION_MAJOR = 2.36
+ATK_VERSION = $(ATK_VERSION_MAJOR).0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
 ATK_LICENSE = LGPL-2.0+
