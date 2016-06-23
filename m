From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 23 Jun 2016 07:41:56 +0200
Subject: [Buildroot] [PATCH v2] libsoc: bump to version 0.8.2
Message-ID: <1466660516-6038-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

License file changed from COPYING to LICENCE.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v2: change license filename (Peter Korsgaard)

 package/libsoc/libsoc.hash | 4 ++--
 package/libsoc/libsoc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsoc/libsoc.hash b/package/libsoc/libsoc.hash
index e6a8577..77f2fad 100644
--- a/package/libsoc/libsoc.hash
+++ b/package/libsoc/libsoc.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  fc7f4c4ec5cc694833f27d91603aaaa6a43e8100ab26bac47f553753c8d45ac0  libsoc-0.7.1.tar.gz
+# Locally computed:
+sha256  8df626bde365b94a805e1c323104c63a7429ec64c9df815cd1d9b9c4b317e066  libsoc-0.8.2.tar.gz
diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index 84e281f..878616b 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBSOC_VERSION = 0.7.1
+LIBSOC_VERSION = 0.8.2
 LIBSOC_SITE = $(call github,jackmitch,libsoc,$(LIBSOC_VERSION))
 LIBSOC_LICENSE = LGPLv2.1
-LIBSOC_LICENSE_FILES = COPYING
+LIBSOC_LICENSE_FILES = LICENCE
 LIBSOC_AUTORECONF = YES
 LIBSOC_INSTALL_STAGING = YES
 
-- 
2.1.4
