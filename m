From: Axel Lin <axel.lin@ingics.com>
Date: Sat, 12 Oct 2013 10:15:25 +0800
Subject: [Buildroot] [PATCH] pcsc-lite: bump to version 1.8.8
Message-ID: <1381544125.10020.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/pcsc-lite/pcsc-lite.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index c126b3f..4cc628f 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.8.6
+PCSC_LITE_VERSION = 1.8.8
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
-PCSC_LITE_SITE = http://alioth.debian.org/frs/download.php/file/3757
+PCSC_LITE_SITE = http://alioth.debian.org/frs/download.php/file/3862
 PCSC_LITE_INSTALL_STAGING = YES
 PCSC_LITE_DEPENDENCIES = host-pkgconf
 PCSC_LITE_LICENSE = BSD-3c
-- 
1.8.1.2
