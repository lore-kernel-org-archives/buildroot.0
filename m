From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:57:19 +0100
Subject: [Buildroot] [git commit] package/libbluray: bump version to 1.0.0
Message-ID: <20170320205727.315538257D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e12181db4c7a8c8b83723ccd7aea29e60d8641bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libbluray/libbluray.hash | 4 ++--
 package/libbluray/libbluray.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index ea0df50..f3e1210 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,2 +1,2 @@
-# From http://get.videolan.org/libbluray/0.9.3/libbluray-0.9.3.tar.bz2.sha512
-sha512	1e308b85c51d43b23b186fdd2631f963d4c25de8aff29f335e131b32a175434ee21460a7aa470c508ad13662cf9052649bb4eb974dbd709eb9e6797fb84e0823	libbluray-0.9.3.tar.bz2
+# From http://get.videolan.org/libbluray/1.0.0/libbluray-1.0.0.tar.bz2.sha512
+sha512 fcf2193c3b76f3436bc88ce8853cac16f29c3bb6c66447109c14202a41ea938cb6814502a8f724fb1b31add6bd36b42d3aed3eb4a8010c123537e073bd7a0be1  libbluray-1.0.0.tar.bz2
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index dfe58f4..adce8c4 100644
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
