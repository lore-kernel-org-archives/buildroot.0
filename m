From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Apr 2021 15:49:54 +0200
Subject: [Buildroot] [git commit] package/libva-utils: bump version to 2.11.1
Message-ID: <20210403132549.AAAF1801B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=663e1fa563dbd5ed4625744cd4116cec93029b37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/intel/libva-utils/releases/tag/2.11.1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva-utils/libva-utils.hash | 6 +++---
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 349fcc42ae..23d1c7677f 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva-utils/releases/download/2.10.0/libva-utils-2.10.0.tar.bz2.sha1sum
-sha1  083a31354d2d49a4b9b8d4bccd6e7b77fc447154  libva-utils-2.10.0.tar.bz2
+# From https://github.com/intel/libva-utils/releases/download/2.11.1/libva-utils-2.11.1.tar.bz2.sha1sum
+sha1  89988122f76e8c0b3645006b60dfdbd9a3ae2e8c  libva-utils-2.11.1.tar.bz2
 # Locally computed
-sha256  33f06929faa395f55ec816432679219c56d70850bf465c848f0418e8a4f0352b  libva-utils-2.10.0.tar.bz2
+sha256  9e5a6138869c79bdc0cd0598b6a6763110360f301e7294e5270704cb38bf53fb  libva-utils-2.11.1.tar.bz2
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 4634ba4eb7..181af30337 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.10.0
+LIBVA_UTILS_VERSION = 2.11.1
 LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
 LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
 LIBVA_UTILS_LICENSE = MIT
