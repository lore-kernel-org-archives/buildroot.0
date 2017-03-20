From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 20 Mar 2017 19:17:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/libbluray: bump version to 1.0.0
Message-ID: <20170320181725.2085-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libbluray/libbluray.hash | 4 ++--
 package/libbluray/libbluray.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index ea0df505d..f3e12108b 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,2 +1,2 @@
-# From http://get.videolan.org/libbluray/0.9.3/libbluray-0.9.3.tar.bz2.sha512
-sha512	1e308b85c51d43b23b186fdd2631f963d4c25de8aff29f335e131b32a175434ee21460a7aa470c508ad13662cf9052649bb4eb974dbd709eb9e6797fb84e0823	libbluray-0.9.3.tar.bz2
+# From http://get.videolan.org/libbluray/1.0.0/libbluray-1.0.0.tar.bz2.sha512
+sha512 fcf2193c3b76f3436bc88ce8853cac16f29c3bb6c66447109c14202a41ea938cb6814502a8f724fb1b31add6bd36b42d3aed3eb4a8010c123537e073bd7a0be1  libbluray-1.0.0.tar.bz2
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index dfe58f4e1..adce8c4cb 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 0.9.3
+LIBBLURAY_VERSION = 1.0.0
 LIBBLURAY_SITE = http://get.videolan.org/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
-- 
2.11.0
