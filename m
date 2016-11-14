From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 21:36:11 +0100
Subject: [Buildroot] [git commit branch/next] lcms2: bump version to 2.8
Message-ID: <20161114203615.4161381D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4309b96f3a38a2ed40389612c28a47917595667b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For ChangeLog see [1].

[1] https://github.com/mm2/Little-CMS/blob/master/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lcms2/lcms2.hash | 7 +++----
 package/lcms2/lcms2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index 908822f..1cf1017 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,5 +1,4 @@
-# From http://sourceforge.net/projects/lcms/files/lcms/2.7/
-sha1	625f0d74bad4a0f6f917120fd992437d26f754d2	lcms2-2.7.tar.gz
-md5	06c1626f625424a811fb4b5eb070839d		lcms2-2.7.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.8
+sha1 e9535ec4a572b8fc7a1c405c35e6f4dc97714197 lcms2-2.8.tar.gz
 # Locally computed:
-sha256	4524234ae7de185e6b6da5d31d6875085b2198bc63b1211f7dde6e2d197d6a53	lcms2-2.7.tar.gz
+sha256 66d02b229d2ea9474e62c2b6cd6720fde946155cd1d0d2bffdab829790a0fb22 lcms2-2.8.tar.gz
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 265af29..8d0609e 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.7
-LCMS2_SITE = http://downloads.sourceforge.net/lcms/lcms
+LCMS2_VERSION = 2.8
+LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
 LCMS2_INSTALL_STAGING = YES
