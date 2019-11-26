From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 26 Nov 2019 18:28:45 +0100
Subject: [Buildroot] [PATCH/next] package/iproute2: bump to version 5.4.0
Message-ID: <1574789325-28592-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index d130466..4158848 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	cb1c1e45993a3bd2438543fd4332d70f1726a6e6ff97dc613a8258c993117b3f  iproute2-5.3.0.tar.xz
+sha256	fe97aa60a0d4c5ac830be18937e18dc3400ca713a33a89ad896ff1e3d46086ae  iproute2-5.4.0.tar.xz
 sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 0efd4e6..6dc3fbd 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.3.0
+IPROUTE2_VERSION = 5.4.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.7.4
