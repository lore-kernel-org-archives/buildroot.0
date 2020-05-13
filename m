From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 May 2020 22:00:24 +0200
Subject: [Buildroot] [git commit] package/clamav: security bump version to
 0.102.3
Message-ID: <20200513194503.1A8EA91898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f617ac6ca408e1026bff273095df6a401e13943
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2020-3327 & CVE-2020-3341.

Release notes:
https://blog.clamav.net/2020/05/clamav-01023-security-patch-released.html

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/clamav/clamav.hash | 26 +++++++++++++-------------
 package/clamav/clamav.mk   |  2 +-
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 613d9b4122..f98dc6b320 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,14 +1,14 @@
 # Locally calculated
-sha256 89fcdcc0eba329ca84d270df09d2bb89ae55f5024b0c3bddb817512fb2c907d3  clamav-0.102.2.tar.gz
-sha256 0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
-sha256 d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
-sha256 dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
-sha256 6dce638b76399e7521ad8e182d3e33e4496c85b3b69b6ff434b53017101e82ad  COPYING.getopt
-sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LGPL
-sha256 e3a9b913515a42f8ff3ef1551c3a2cdba383c39ed959729e0e2911219496ad74  COPYING.llvm
-sha256 d96d71b66aa32c4a2d1619b9ca3347dafa9460bcf0fb5ac2408916067ad31dfc  COPYING.lzma
-sha256 accdcf2455c07b99abea59016b3663eaef926a92092d103bfaa25fed27cf6b24  COPYING.pcre
-sha256 e2c1395a3d9fea6d5d25847c9d783db6e2cc8b085b4025861f459139c5dfd90b  COPYING.regex
-sha256 1faccc6b5c7b958fb807a3f573d5be9bf7889fe898f7e0617c544b05a81bfd00  COPYING.unrar
-sha256 a20d6317c5384e8d4c05f9c31097878675d9429ec46090656166039cc10bc957  COPYING.YARA
-sha256 c2f77553f8d870c5635b0dace0519253233f172b33ce1fdf6578610706294eee  COPYING.zlib
+sha256  ed3050c4569989ee7ab54c7b87246b41ed808259632849be0706467442dc0693  clamav-0.102.3.tar.gz
+sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
+sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
+sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
+sha256  6dce638b76399e7521ad8e182d3e33e4496c85b3b69b6ff434b53017101e82ad  COPYING.getopt
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LGPL
+sha256  e3a9b913515a42f8ff3ef1551c3a2cdba383c39ed959729e0e2911219496ad74  COPYING.llvm
+sha256  d96d71b66aa32c4a2d1619b9ca3347dafa9460bcf0fb5ac2408916067ad31dfc  COPYING.lzma
+sha256  accdcf2455c07b99abea59016b3663eaef926a92092d103bfaa25fed27cf6b24  COPYING.pcre
+sha256  e2c1395a3d9fea6d5d25847c9d783db6e2cc8b085b4025861f459139c5dfd90b  COPYING.regex
+sha256  1faccc6b5c7b958fb807a3f573d5be9bf7889fe898f7e0617c544b05a81bfd00  COPYING.unrar
+sha256  a20d6317c5384e8d4c05f9c31097878675d9429ec46090656166039cc10bc957  COPYING.YARA
+sha256  c2f77553f8d870c5635b0dace0519253233f172b33ce1fdf6578610706294eee  COPYING.zlib
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index b8d7de52fa..eec18fcc02 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.102.2
+CLAMAV_VERSION = 0.102.3
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
