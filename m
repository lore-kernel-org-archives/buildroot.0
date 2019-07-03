From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 4 Jul 2019 00:04:47 +0200
Subject: [Buildroot] [git commit] package/glibmm: bump to version 2.60.0
Message-ID: <20190703220352.E8E438904D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2548ff53b08fb71d6cc559de53cb55cde3163942
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/glibmm/glibmm.hash | 4 ++--
 package/glibmm/glibmm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index 6131f9dcaf..b3ebd535d8 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/glibmm/2.56/glibmm-2.56.0.sha256sum
-sha256	6e74fcba0d245451c58fc8a196e9d103789bc510e1eee1a9b1e816c5209e79a9 glibmm-2.56.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.60/glibmm-2.60.0.sha256sum
+sha256	a3a1b1c9805479a16c0018acd84b3bfff23a122aee9e3c5013bb81231aeef2bc glibmm-2.60.0.tar.xz
 # License files, locally calculated
 sha256	3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7 COPYING
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6 COPYING.tools
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index e66d56eac9..b5d0c8bc48 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLIBMM_VERSION_MAJOR = 2.56
+GLIBMM_VERSION_MAJOR = 2.60
 GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
 GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
