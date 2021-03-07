From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  7 Mar 2021 12:27:35 +0100
Subject: [Buildroot] [PATCH] package/gd: bump to version 2.3.2
Message-ID: <20210307112735.1282954-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gd/gd.hash | 2 +-
 package/gd/gd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gd/gd.hash b/package/gd/gd.hash
index 3fd4ca0eb..25e64e801 100644
--- a/package/gd/gd.hash
+++ b/package/gd/gd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9767917d9f818faec4ddd763fe4a4ad9f6322c3d25da290ab2ea3e2ce4b52a7b  libgd-2.3.1.tar.xz
+sha256  478a047084e0d89b83616e4c2cf3c9438175fb0cc55d8c8967f06e0427f7d7fb  libgd-2.3.2.tar.xz
 sha256  4d80b4af6c38d7a65128c881623dee2a5daee6b3a6ccab74a5cdfa0dfda96da7  COPYING
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index a1c570404..97a1a143e 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GD_VERSION = 2.3.1
+GD_VERSION = 2.3.2
 GD_SOURCE = libgd-$(GD_VERSION).tar.xz
 GD_SITE = https://github.com/libgd/libgd/releases/download/gd-$(GD_VERSION)
 GD_INSTALL_STAGING = YES
-- 
2.27.0
