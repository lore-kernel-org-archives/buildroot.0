From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 May 2021 10:46:39 -0700
Subject: [Buildroot] [PATCH/NEXT: 01/11] package/libsepol: bump to version
 3.2
In-Reply-To: <20210520174649.1188340-1-aduskett@gmail.com>
References: <20210520174649.1188340-1-aduskett@gmail.com>
Message-ID: <20210520174649.1188340-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libsepol/libsepol.hash | 4 ++--
 package/libsepol/libsepol.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index 1759d3ba04..b273f982b6 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 ae6778d01443fdd38cd30eeee846494e19f4d407b09872580372f4aa4bf8a3cc  libsepol-3.1.tar.gz
+sha256  dfc7f662af8000116e56a01de6a0394ed79be1b34b999e551346233c5dd19508  libsepol-3.2.tar.gz
 
 # Hash for license file
-sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index a4398bdc42..55125f2203 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 3.1
-LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/20200710
+LIBSEPOL_VERSION = 3.2
+LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEPOL_VERSION)
 LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = COPYING
 LIBSEPOL_CPE_ID_VENDOR = selinuxproject
-- 
2.31.1
