From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  8 Apr 2019 14:50:05 -0400
Subject: [Buildroot] [PATCH] package/libsepol: bump version to 2.9
In-Reply-To: <20190408185013.71465-1-aduskett@gmail.com>
References: <20190408185013.71465-1-aduskett@gmail.com>
Message-ID: <20190408185013.71465-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libsepol/libsepol.hash | 2 +-
 package/libsepol/libsepol.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index 599133c116..83eb63213e 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 3ad6916a8352bef0bad49acc8037a5f5b48c56f94e4cb4e1959ca475fa9d24d6  libsepol-2.8.tar.gz
+sha256 a34b12b038d121e3e459b1cbaca3c9202e983137819c16baf63658390e3f1d5d  libsepol-2.9.tar.gz
 
 # Hash for license file
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index a1e3836851..58b9b9c374 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 2.8
-LIBSEPOL_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524
+LIBSEPOL_VERSION = 2.9
+LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
 LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = COPYING
 
-- 
2.20.1
