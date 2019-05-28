From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 28 May 2019 18:10:26 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/lapack: bump version to 3.8.0
Message-ID: <20190528161026.30217-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: http://www.netlib.org/lapack/lapack-3.8.0.html

Added license hash, adjusted source tarball URL.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.20.1
