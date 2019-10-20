From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 15:57:44 +0200
Subject: [Buildroot] [git commit] package/sbc: bump to version 1.4
Message-ID: <20191020135134.2FB2D82EAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9ef108e7ecb1cbc4df0202c4da2c8edcb4e6251
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hashes for license files

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sbc/sbc.hash | 6 +++++-
 package/sbc/sbc.mk   | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/sbc/sbc.hash b/package/sbc/sbc.hash
index be3c8f76f4..d703f23437 100644
--- a/package/sbc/sbc.hash
+++ b/package/sbc/sbc.hash
@@ -1,2 +1,6 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
-sha256	e61022cf576f14190241e7071753fdacdce5d1dea89ffd704110fc50be689309	sbc-1.3.tar.xz
+sha256	518bf46e6bb3dc808a95e1eabad26fdebe8a099c1e781c27ed7fca6c2f4a54c9	sbc-1.4.tar.xz
+
+# sha256 locally computed
+sha256	b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259	COPYING
+sha256	ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5	COPYING.LIB
diff --git a/package/sbc/sbc.mk b/package/sbc/sbc.mk
index 77661c1898..73e4aceb85 100644
--- a/package/sbc/sbc.mk
+++ b/package/sbc/sbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SBC_VERSION = 1.3
+SBC_VERSION = 1.4
 SBC_SOURCE = sbc-$(SBC_VERSION).tar.xz
 SBC_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 SBC_INSTALL_STAGING = YES
