From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 23:05:07 +0200
Subject: [Buildroot] [git commit] package/glibmm: bump to version 2.62.0
Message-ID: <20191002210033.B2EAE8074E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8a7d02e218736a0bfb4b6874e735d0219d202ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibmm/glibmm.hash | 4 ++--
 package/glibmm/glibmm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index b3ebd535d8..021b77ef0a 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.60/glibmm-2.60.0.sha256sum
-sha256	a3a1b1c9805479a16c0018acd84b3bfff23a122aee9e3c5013bb81231aeef2bc glibmm-2.60.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.62/glibmm-2.62.0.sha256sum
+sha256	36659f13cc73282392d1305858f3bbca46fbd1ce2f078cc9db8b9f79b2e93cfe glibmm-2.62.0.tar.xz
 # License files, locally calculated
 sha256	3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7 COPYING
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6 COPYING.tools
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index b5d0c8bc48..c31c794ca2 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLIBMM_VERSION_MAJOR = 2.60
+GLIBMM_VERSION_MAJOR = 2.62
 GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
 GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
