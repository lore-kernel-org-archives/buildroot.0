From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Jun 2021 14:33:35 +0200
Subject: [Buildroot] [git commit] package/libva-utils: bump version to 2.12.0
Message-ID: <20210626120142.D0FA88E144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6daccd82066a1c223cbaf3c07e67704fc22411de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/intel/libva-utils/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva-utils/libva-utils.hash | 6 +++---
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 23d1c7677f..967c350373 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva-utils/releases/download/2.11.1/libva-utils-2.11.1.tar.bz2.sha1sum
-sha1  89988122f76e8c0b3645006b60dfdbd9a3ae2e8c  libva-utils-2.11.1.tar.bz2
+# From https://github.com/intel/libva-utils/releases/download/2.12.0/libva-utils-2.12.0.tar.bz2.sha1sum
+sha1  734ad8d4e39bf90b5670224272489f1745024ae2  libva-utils-2.12.0.tar.bz2
 # Locally computed
-sha256  9e5a6138869c79bdc0cd0598b6a6763110360f301e7294e5270704cb38bf53fb  libva-utils-2.11.1.tar.bz2
+sha256  bbe49e68fbdf379acc769e4c1680a76be3e2b48020ca320edafaf7235b62cc44  libva-utils-2.12.0.tar.bz2
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 181af30337..c75091c7c7 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.11.1
+LIBVA_UTILS_VERSION = 2.12.0
 LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
 LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
 LIBVA_UTILS_LICENSE = MIT
