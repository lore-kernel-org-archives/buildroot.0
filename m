From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  8 Jun 2021 21:55:14 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/ell: bump version to 0.40
Message-ID: <20210608195515.15261-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 5f1cc7ddcb..f2b3fcc7e2 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  653e2e139e23ed31e03c56c05f15321a9e818e2dca00a315c18d2c7b72f15d08  ell-0.39.tar.xz
+sha256  b9bf5c14f2963591ea1372049c05646919a9ed46fcee5cd11ede1022c99ffbbd  ell-0.40.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index bd291c60db..edaf07e063 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.39
+ELL_VERSION = 0.40
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.31.1
