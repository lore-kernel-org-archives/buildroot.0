From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  1 Mar 2021 18:50:56 +0100
Subject: [Buildroot] [PATCH] package/gd: bump to version 2.3.1
Message-ID: <20210301175056.805329-1-francois.perrad@gadz.org>
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
index 5aec317f2..3fd4ca0eb 100644
--- a/package/gd/gd.hash
+++ b/package/gd/gd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ecd9155b9a417fb3f837f29e5966323796de247789163761dd72dbf83bfcac58  libgd-2.3.0.tar.xz
+sha256  9767917d9f818faec4ddd763fe4a4ad9f6322c3d25da290ab2ea3e2ce4b52a7b  libgd-2.3.1.tar.xz
 sha256  4d80b4af6c38d7a65128c881623dee2a5daee6b3a6ccab74a5cdfa0dfda96da7  COPYING
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index f54c2b37a..53bf62dab 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GD_VERSION = 2.3.0
+GD_VERSION = 2.3.1
 GD_SOURCE = libgd-$(GD_VERSION).tar.xz
 GD_SITE = https://github.com/libgd/libgd/releases/download/gd-$(GD_VERSION)
 GD_INSTALL_STAGING = YES
-- 
2.27.0
