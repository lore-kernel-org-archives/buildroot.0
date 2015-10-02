From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 21:48:42 +0200
Subject: [Buildroot] [git commit] pciutils: bump to version 3.4.0
Message-ID: <20151002195300.43F0681DF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=376284ba4a2f7e9bea0c38cbe11591ff8e306293
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pciutils/pciutils.hash |    2 +-
 package/pciutils/pciutils.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index cc901d1..cda0ac2 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256	514a3bdb77e4cdbe9e970e1885af46e0ba2011bf97364368c455ade0edd4e3a9	pciutils-3.3.1.tar.xz
+sha256	f8898ff6d58f52e9e17e2763bff479bb9511bcf0d8711084fa77f1b6b1739196	pciutils-3.4.0.tar.xz
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 12c13b2..6c0e660 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.3.1
+PCIUTILS_VERSION = 3.4.0
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
