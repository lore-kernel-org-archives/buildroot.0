From: James Knight <james.knight@rockwellcollins.com>
Date: Mon, 19 Oct 2015 16:54:25 -0400
Subject: [Buildroot] [PATCH 1/1] feh: bump to version 2.14
Message-ID: <1445288065-5908-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/feh/feh.hash | 2 +-
 package/feh/feh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index 2ba2b01..396f33d 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  865088d0481f6862d79d7c08d7b6cf1d25058a74a5784e511a1422fea8aba980  feh-2.13.1.tar.bz2
+sha256  3829cd8995ec7cc08095a2b22a6c98d1e2638bd87c8b4f0e85a059c6f0edbc48  feh-2.14.tar.bz2
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 1fcec20..03435dc 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 2.13.1
+FEH_VERSION = 2.14
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
-- 
1.9.5.msysgit.1
