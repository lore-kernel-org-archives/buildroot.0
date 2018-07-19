From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 19 Jul 2018 13:59:21 -0300
Subject: [Buildroot] [PATCH] util-linux: bump to version 2.32.1
Message-ID: <20180719165921.1092-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Small improvements and bug fixes. See change log at

    http://www.kernel.org/pub/linux/utils/util-linux/v2.32/v2.32.1-ChangeLog

Change-Id: Ia337a51bb72fc25ca7867eeb88d8ed86bcfe7be8
Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/util-linux/util-linux.hash | 2 +-
 package/util-linux/util-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 8f93d793c8..1b7d6db45a 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.32/sha256sums.asc
-sha256 6c7397abc764e32e8159c2e96042874a190303e77adceb4ac5bd502a272a4734  util-linux-2.32.tar.xz
+sha256 86e6707a379c7ff5489c218cfaf1e3464b0b95acf7817db0bc5f179e356a67b2  util-linux-2.32.1.tar.xz
 # License files, locally calculated
 sha256 1e4b65802b0df8115395c697029d03339f983d451a473a08643309c684410d9a  README.licensing
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPLv2
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 76f4b97f5f..d6b3c33b26 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 UTIL_LINUX_VERSION_MAJOR = 2.32
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-- 
2.14.4
