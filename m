From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 23:43:36 +0200
Subject: [Buildroot] [git commit branch/next] glibmm: bump version to 2.56.0
Message-ID: <20180905214253.4BBF582966@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=acb198abd089afe56f76e646ea156fcdbab6d56a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also add hashes for the license files.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibmm/glibmm.hash | 7 +++++--
 package/glibmm/glibmm.mk   | 4 ++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index 570192e2f8..6131f9dcaf 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,2 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/glibmm/2.54/glibmm-2.54.1.sha256sum
-sha256	7cc28c732b04d70ed34f0c923543129083cfb90580ea4a2b4be5b38802bf6a4a glibmm-2.54.1.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/glibmm/2.56/glibmm-2.56.0.sha256sum
+sha256	6e74fcba0d245451c58fc8a196e9d103789bc510e1eee1a9b1e816c5209e79a9 glibmm-2.56.0.tar.xz
+# License files, locally calculated
+sha256	3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7 COPYING
+sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6 COPYING.tools
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 7fa13f21a2..71f1dfd36f 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIBMM_VERSION_MAJOR = 2.54
-GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).1
+GLIBMM_VERSION_MAJOR = 2.56
+GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
 GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
