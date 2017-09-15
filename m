From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 15 Sep 2017 07:15:58 +0300
Subject: [Buildroot] [PATCH] iproute2: bump to version 4.13.0
Message-ID: <e5beb4c096495ed937f68a64872bc1e59ed9a7e7.1505448958.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index ace94b1d7521..795403991691 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	2e0a4c4262d9f6c169885a6e16c4c5c5f1ef6fd57b6a0e7b41f42be5bb6ebd7d	iproute2-4.12.0.tar.xz
+sha256	9cfb81edf8c8509e03daa77cf62aead01c4a827132f6c506578f94cc19415c50	iproute2-4.13.0.tar.xz
 sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 1dc7abe3d64a..d002d4df7afb 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 4.12.0
+IPROUTE2_VERSION = 4.13.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.14.1
