From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 30 Aug 2019 11:40:33 -0700
Subject: [Buildroot] [PATCH] package/pciutils: bump to version 3.6.2
In-Reply-To: <20190830184034.26771-1-chrismcc@gmail.com>
References: <20190830184034.26771-1-chrismcc@gmail.com>
Message-ID: <20190830184034.26771-2-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/pciutils/pciutils.hash | 4 ++--
 package/pciutils/pciutils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index da0358cacd..2393643e53 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,3 +1,3 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256	1d62f8fa192f90e61c35a6fc15ff3cb9a7a792f782407acc42ef67817c5939f5	pciutils-3.5.5.tar.xz
-sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	COPYING
+sha256	db452ec986edefd88af0d222d22f6102f8030a8633fdfe846c3ae4bde9bb93f3 pciutils-3.6.2.tar.xz
+sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6 COPYING
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 30d429e75a..aa19211cd0 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.5.5
+PCIUTILS_VERSION = 3.6.2
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
-- 
2.20.1
