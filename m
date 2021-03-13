From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 13 Mar 2021 08:11:45 +0100
Subject: [Buildroot] [PATCH 2/2] package/luasec: bump to version 1.0
In-Reply-To: <20210313071145.1558401-1-francois.perrad@gadz.org>
References: <20210313071145.1558401-1-francois.perrad@gadz.org>
Message-ID: <20210313071145.1558401-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff LICENSE:
-LuaSec 0.9 license
-Copyright (C) 2006-2019 Bruno Silvestre, UFG
+LuaSec 1.0 license
+Copyright (C) 2006-2021 Bruno Silvestre, UFG

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luasec/luasec.hash | 4 ++--
 package/luasec/luasec.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
index c50da8b9a..2ea8cbcb0 100644
--- a/package/luasec/luasec.hash
+++ b/package/luasec/luasec.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 b87c7d3bc5f07f5ad6fcf90f32f182d9a4a3f5f6b07e19221a86e89179ebd702  luasec-0.9-1.src.rock
-sha256 4e1b2e7a46c756febf3ea76440fb5456c17e6c0312fd0135bd4649f4a2cd0d41  luasec/LICENSE
+sha256 b7e18f475c64896fe4921d367adabae765914f7526a68487a5fa6831040e7138  luasec-1.0-1.src.rock
+sha256 0d3431dad143f41c8902e4ee867e386a702ebad856c45239fb86460e27dabfbf  luasec/LICENSE
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index 42d292245..3ef0c14da 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASEC_VERSION = 0.9-1
+LUASEC_VERSION = 1.0-1
 LUASEC_SUBDIR = luasec
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
-- 
2.27.0
