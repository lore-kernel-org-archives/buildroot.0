From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Jan 2016 07:44:58 -0300
Subject: [Buildroot] [PATCH] pciutils: bump to version 3.4.1
Message-ID: <1451904298-24613-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pciutils/pciutils.hash | 2 +-
 package/pciutils/pciutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index cda0ac2..dd75e42 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256	f8898ff6d58f52e9e17e2763bff479bb9511bcf0d8711084fa77f1b6b1739196	pciutils-3.4.0.tar.xz
+sha256	865554cc5604d1644bd8da38d94845405e2a319a6d5acabc6a0296417684a82a	pciutils-3.4.1.tar.xz
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 6c0e660..24f250e 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.4.0
+PCIUTILS_VERSION = 3.4.1
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
-- 
2.4.10
