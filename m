From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun,  8 Dec 2019 12:19:26 -0800
Subject: [Buildroot] [PATCH 04/11] package/libsepol: bump version to 3.0
In-Reply-To: <20191208201933.3832327-1-aduskett@gmail.com>
References: <20191208201933.3832327-1-aduskett@gmail.com>
Message-ID: <20191208201933.3832327-4-aduskett@gmail.com>
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
index 83eb63213e..a43d387a4f 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 a34b12b038d121e3e459b1cbaca3c9202e983137819c16baf63658390e3f1d5d  libsepol-2.9.tar.gz
+sha256 5b7ae1881909f1048b06f7a0c364c5c8a86ec12e0ec76e740fe9595a6033eb79  libsepol-3.0.tar.gz
 
 # Hash for license file
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 58b9b9c374..59ff2640df 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 2.9
-LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+LIBSEPOL_VERSION = 3.0
+LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
 LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = COPYING
 
-- 
2.23.0
