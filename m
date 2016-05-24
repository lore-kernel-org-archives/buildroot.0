From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 17:04:11 +0200
Subject: [Buildroot] [git commit branch/next] package/libbluray: bump
	version to 0.9.3
Message-ID: <20160524150417.91067818CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=089bda1416b52417609fb9ff779ea2e52edcdd42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libbluray/libbluray.hash | 4 ++--
 package/libbluray/libbluray.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index 9acd89d..ea0df50 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,2 +1,2 @@
-# From http://get.videolan.org/libbluray/0.9.2/libbluray-0.9.2.tar.bz2.sha512
-sha512	f7fda2ef4c0ec70eb9a38aed0e76d21d8784410cb13713e7ee66ecd23a1cc58325977b046d40c526554a4a4e4cf96706a233e15451bf34892aff201b47e25aef	libbluray-0.9.2.tar.bz2
+# From http://get.videolan.org/libbluray/0.9.3/libbluray-0.9.3.tar.bz2.sha512
+sha512	1e308b85c51d43b23b186fdd2631f963d4c25de8aff29f335e131b32a175434ee21460a7aa470c508ad13662cf9052649bb4eb974dbd709eb9e6797fb84e0823	libbluray-0.9.3.tar.bz2
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 2cc27f1..dfe58f4 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 0.9.2
+LIBBLURAY_VERSION = 0.9.3
 LIBBLURAY_SITE = http://get.videolan.org/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
