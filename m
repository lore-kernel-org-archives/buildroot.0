From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:43:36 +0200
Subject: [Buildroot] [git commit] package/libfreeglut: bump version to 3.2.1
Message-ID: <20191002194115.637FC882DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d757110fbc37f2f58c11921f953e53dc1540027
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added md5 hash provided by upstream and locally computed sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libfreeglut/libfreeglut.hash | 9 +++++----
 package/libfreeglut/libfreeglut.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libfreeglut/libfreeglut.hash b/package/libfreeglut/libfreeglut.hash
index cc7a286616..2771cbde2f 100644
--- a/package/libfreeglut/libfreeglut.hash
+++ b/package/libfreeglut/libfreeglut.hash
@@ -1,5 +1,6 @@
-# From http://sourceforge.net/projects/freeglut/files/freeglut/3.0.0/
-sha1	fca52242f9344627a30f11487ee42002e6b0dacd	freeglut-3.0.0.tar.gz
-
-# Hash for license file:
+# From http://sourceforge.net/projects/freeglut/files/freeglut/3.2.1/
+md5 cd5c670c1086358598a6d4a9d166949d  freeglut-3.2.1.tar.gz
+sha1 7a62e0d2caad92ff745bc5037592b2753f0b2f20  freeglut-3.2.1.tar.gz
+# Locally computed
+sha256 d4000e02102acaf259998c870e25214739d1f16f67f99cb35e4f46841399da68  freeglut-3.2.1.tar.gz
 sha256	b6593d5ec4c113a274abb85b10e8615895cb0ddb89f7912af5fe5aa8df38a275	COPYING
diff --git a/package/libfreeglut/libfreeglut.mk b/package/libfreeglut/libfreeglut.mk
index 507cb523ab..379de3121b 100644
--- a/package/libfreeglut/libfreeglut.mk
+++ b/package/libfreeglut/libfreeglut.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFREEGLUT_VERSION = 3.0.0
+LIBFREEGLUT_VERSION = 3.2.1
 LIBFREEGLUT_SOURCE = freeglut-$(LIBFREEGLUT_VERSION).tar.gz
 LIBFREEGLUT_SITE = http://downloads.sourceforge.net/freeglut
 LIBFREEGLUT_LICENSE = MIT
