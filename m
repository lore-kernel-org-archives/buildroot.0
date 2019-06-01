From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 14:11:27 +0200
Subject: [Buildroot] [git commit] package/lapack: bump version to 3.8.0
Message-ID: <20190602201238.20C32811FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26d5558b5d93c15957bc78aea028ab30a4297558
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: http://www.netlib.org/lapack/lapack-3.8.0.html

Added license hash, adjusted source tarball URL.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lapack/lapack.hash | 3 ++-
 package/lapack/lapack.mk   | 3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lapack/lapack.hash b/package/lapack/lapack.hash
index fd3feef554..395087e199 100644
--- a/package/lapack/lapack.hash
+++ b/package/lapack/lapack.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 f6c53fd9f56932f3ddb3d5e24c1c07e4cd9b3b08e7f89de9c867125eecc9a1c8  lapack-3.7.1.tgz
+sha256 deb22cc4a6120bff72621155a9917f485f96ef8319ac074a7afbc68aab88bcf6  lapack-3.8.0.tar.gz
+sha256 d56bd4441b999b80c88df04faf0d8b3d7d3b2bd781cf91242c4188e8a6d0f8be  LICENSE
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index 4e74bbd659..3b59214e4b 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-LAPACK_VERSION = 3.7.1
-LAPACK_SOURCE = lapack-$(LAPACK_VERSION).tgz
+LAPACK_VERSION = 3.8.0
 LAPACK_LICENSE = BSD-3-Clause
 LAPACK_LICENSE_FILES = LICENSE
 LAPACK_SITE = http://www.netlib.org/lapack
