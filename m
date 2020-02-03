From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  3 Feb 2020 02:21:09 -0800
Subject: [Buildroot] [PATCH 1/2] package/ninja: bump to version 1.10.0
Message-ID: <20200203102110.985994-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/ninja/ninja.hash | 2 +-
 package/ninja/ninja.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
index f0b69e7f87..cd9bb08832 100644
--- a/package/ninja/ninja.hash
+++ b/package/ninja/ninja.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 5d7ec75828f8d3fd1a0c2f31b5b0cea780cdfe1031359228c428c1a48bfcd5b9 ninja-1.9.0.tar.gz
+sha256 3810318b08489435f8efc19c05525e80a993af5a55baa0dfeae0465a9d45f99f ninja-1.10.0.tar.gz
 sha256 eb7e9ab9690124c5c9f42bdc81383d886a3dede26345b6ed15bbad7caf81f7ea COPYING
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index 281cd70412..0d9426d1f4 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NINJA_VERSION = 1.9.0
+NINJA_VERSION = 1.10.0
 NINJA_SITE = $(call github,ninja-build,ninja,v$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
-- 
2.24.1
