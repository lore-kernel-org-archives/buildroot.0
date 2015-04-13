From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Apr 2015 18:42:55 -0300
Subject: [Buildroot] [PATCH] iproute2: bump to version 4.0.0
Message-ID: <1428961375-31624-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 40dd0a5..336d6b6 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,2 +1,2 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	e2f9f8c36e166f2ba6c0e1e7a9ad84cdf7c1615b93df49dac44563d7b57fd7b0	iproute2-3.19.0.tar.xz
+sha256	5cd06eb1050b858b308b65705725042bb566fd261135e35a73dafb48cd632618	iproute2-4.0.0.tar.xz
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 688ae97..102a222 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 3.19.0
+IPROUTE2_VERSION = 4.0.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex
-- 
2.0.5
