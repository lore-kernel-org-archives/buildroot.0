From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 13:47:56 +0100
Subject: [Buildroot] [git commit] package/lapack: bump to version 3.9.0
Message-ID: <20191224124116.9763F8E1B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d6ecbd81692dd42c4109c92eb92baa0be153683
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most recent release hosted on Github instead of previous location

Signed-off-by: Benjamin Kamath <kamath.ben@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lapack/lapack.hash | 2 +-
 package/lapack/lapack.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lapack/lapack.hash b/package/lapack/lapack.hash
index 395087e199..bac7210c29 100644
--- a/package/lapack/lapack.hash
+++ b/package/lapack/lapack.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 deb22cc4a6120bff72621155a9917f485f96ef8319ac074a7afbc68aab88bcf6  lapack-3.8.0.tar.gz
+sha256 106087f1bb5f46afdfba7f569d0cbe23dacb9a07cd24733765a0e89dbe1ad573  lapack-3.9.0.tar.gz
 sha256 d56bd4441b999b80c88df04faf0d8b3d7d3b2bd781cf91242c4188e8a6d0f8be  LICENSE
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index 3b59214e4b..41774f6167 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LAPACK_VERSION = 3.8.0
+LAPACK_VERSION = 3.9.0
 LAPACK_LICENSE = BSD-3-Clause
 LAPACK_LICENSE_FILES = LICENSE
-LAPACK_SITE = http://www.netlib.org/lapack
+LAPACK_SITE = $(call github,Reference-LAPACK,lapack,v$(LAPACK_VERSION))
 LAPACK_INSTALL_STAGING = YES
 LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
 LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON
