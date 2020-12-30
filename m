From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2020 21:26:33 +0100
Subject: [Buildroot] [git commit] package/ethtool: bump version to 5.10
Message-ID: <20201230201027.9BA3E80F45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5eec1b48bf58f5c5f90712e1e2936110131fa8bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998 at free.fr: two spaces for license files in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ethtool/ethtool.hash | 6 +++---
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index f4503ef907..334ff8d503 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  512932010af87bc3e09773c89baea44bca96c1da1151bbcf109fa0e055a88a6f  ethtool-5.9.tar.xz
+sha256  817d5396a9307b4c637b435d4c558b8f5f964a1464a035ca3c0180f4cc93cfcf  ethtool-5.10.tar.xz
 # Locally calculated
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256	5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 7d82386ebe..e1bdd370b0 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 5.9
+ETHTOOL_VERSION = 5.10
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
