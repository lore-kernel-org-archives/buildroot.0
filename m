From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Oct 2016 07:32:58 -0300
Subject: [Buildroot] [PATCH] pciutils: bump to version 3.5.2
Message-ID: <1475577178-25691-1-git-send-email-gustavo@zacarias.com.ar>
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
index efdb108..2572c35 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256	2bf3a4605a562fb6b8b7673bff85a474a5cf383ed7e4bd8886b4f0939013d42f	pciutils-3.5.1.tar.xz
+sha256	3a99141a9f40528d0a0035665a06dc37ddb1ae341658e51b50a76ecf86235efc	pciutils-3.5.2.tar.xz
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 4714cea..e65eadc 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.5.1
+PCIUTILS_VERSION = 3.5.2
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
-- 
2.7.3
