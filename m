From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Nov 2014 10:13:35 -0300
Subject: [Buildroot] [PATCH] pciutils: bump to version 3.3.0
Message-ID: <1415711615-30919-1-git-send-email-gustavo@zacarias.com.ar>
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
index b5892b6..89da715 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256	8d62f84fe7a7401af2ed62d6303255a0cf7333f606c136927f0ba9110ab6824a	pciutils-3.2.1.tar.xz
+sha256	413395d4bdc66fdedd6c993ed9083d1dd73812bf2a679d320f73de35c7801301	pciutils-3.3.0.tar.xz
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 54dc1d9..3abbf18 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.2.1
+PCIUTILS_VERSION = 3.3.0
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
-- 
2.0.4
