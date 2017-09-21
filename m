From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 21 Sep 2017 09:25:14 -0300
Subject: [Buildroot] [PATCH] util-linux: bump to v2.30.2
Message-ID: <20170921122514.4371-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://www.kernel.org/pub/linux/utils/util-linux/v2.30/v2.30.2-ReleaseNotes

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/util-linux/util-linux.hash | 2 +-
 package/util-linux/util-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 6f0bafe9e4..2711f51be2 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.30/sha256sums.asc
-sha256 1be4363a91ac428c9e43fc04dc6d2c66a19ec1e36f1105bd4b481540be13b841  util-linux-2.30.1.tar.xz
+sha256 7b5be5489e9b5b7177832836467aba1c87bf0e9bcbcb5a6f35d76cd4782589dc  util-linux-2.30.2.tar.xz
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 5ebb5e6720..83bb217af9 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 UTIL_LINUX_VERSION_MAJOR = 2.30
-UTIL_LINUX_VERSION_MINOR = 1
+UTIL_LINUX_VERSION_MINOR = 2
 UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).$(UTIL_LINUX_VERSION_MINOR)
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
-- 
2.13.5
