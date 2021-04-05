From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 18:19:56 +0200
Subject: [Buildroot] [git commit] package/lcms2: bump to version 2.12
Message-ID: <20210405160039.79F4E8B774@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3962408c30f375c8a2a5aabb91e28dce088c224f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYING (word wrap:
https://github.com/mm2/Little-CMS/commit/48a1b9a1cae31b6ae001cd1963ab0170b9bebb34)

https://littlecms.com/blog/2021/02/06/lcms2-2.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lcms2/lcms2.hash | 8 ++++----
 package/lcms2/lcms2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index c0916820f7..8477610ff0 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.11
-sha1  7413047c74de29e20caa5c9afc1b12bf07bbf7a7  lcms2-2.11.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.12
+sha1  3d0c0276fcd3930b80c424512ec0b1ed54ec1497  lcms2-2.12.tar.gz
 # Locally computed:
-sha256  dc49b9c8e4d7cdff376040571a722902b682a795bf92985a85b48854c270772e  lcms2-2.11.tar.gz
-sha256  53ad5ca11b8f4079e9c9bfa61575927a33f53526d6d414287149ec3ab61e8e4d  COPYING
+sha256  18663985e864100455ac3e507625c438c3710354d85e5cbb7cd4043e11fe10f5  lcms2-2.12.tar.gz
+sha256  46d4e05af3bce75332a12d01f19bcce7e32b6bac544be28a64043d0231291e31  COPYING
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 44b9965a80..49ddccd82b 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.11
+LCMS2_VERSION = 2.12
 LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
