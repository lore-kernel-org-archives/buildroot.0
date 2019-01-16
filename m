From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Jan 2019 20:54:36 +0200
Subject: [Buildroot] [PATCH] package/lz4: bump to version 1.8.3
Message-ID: <ca3f2496a6d96210866bd39a5eee5978450577c6.1547664876.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lz4/lz4.hash | 2 +-
 package/lz4/lz4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lz4/lz4.hash b/package/lz4/lz4.hash
index 90bd217cdf0e..691ec6c42a37 100644
--- a/package/lz4/lz4.hash
+++ b/package/lz4/lz4.hash
@@ -1,4 +1,4 @@
 # sha256 locally computed
-sha256 0963fbe9ee90acd1d15e9f09e826eaaf8ea0312e854803caf2db0a6dd40f4464  lz4-v1.8.2.tar.gz
+sha256 33af5936ac06536805f9745e0b6d61da606a1f8b4cc5c04dd3cbaca3b9b4fc43  lz4-v1.8.3.tar.gz
 sha256 d15d99c8dc6b0ec22174c0e563a95bc40f9363ca7f9d9d793bb5c5a8e8d0af71  lib/LICENSE
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  programs/COPYING
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 183df456496e..a7152cb5319c 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZ4_VERSION = v1.8.2
+LZ4_VERSION = v1.8.3
 LZ4_SITE = $(call github,lz4,lz4,$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
-- 
2.20.1
