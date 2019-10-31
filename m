From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 31 Oct 2019 18:33:42 +0100
Subject: [Buildroot] [PATCH] package/luasec: bump to version 0.9
Message-ID: <20191031173342.26708-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luasec/luasec.hash | 4 ++--
 package/luasec/luasec.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
index 30ef80101..c50da8b9a 100644
--- a/package/luasec/luasec.hash
+++ b/package/luasec/luasec.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 3c993af8a392511380bf75f68525b5d1f2c6ecdddd17e72d0b51b39c710fa127  luasec-0.8-1.src.rock
-sha256 93b708a114eb0b1028b0549116361da1d24131b042a2bd434c683c7a504877b8  luasec-luasec-0.8/LICENSE
+sha256 b87c7d3bc5f07f5ad6fcf90f32f182d9a4a3f5f6b07e19221a86e89179ebd702  luasec-0.9-1.src.rock
+sha256 4e1b2e7a46c756febf3ea76440fb5456c17e6c0312fd0135bd4649f4a2cd0d41  luasec/LICENSE
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index 9ce358753..42d292245 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LUASEC_VERSION_UPSTREAM = 0.8
-LUASEC_VERSION = $(LUASEC_VERSION_UPSTREAM)-1
-LUASEC_SUBDIR = luasec-luasec-$(LUASEC_VERSION_UPSTREAM)
+LUASEC_VERSION = 0.9-1
+LUASEC_SUBDIR = luasec
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
 LUASEC_DEPENDENCIES = openssl
-- 
2.20.1
