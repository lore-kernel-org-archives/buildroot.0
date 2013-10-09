From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 09 Oct 2013 10:02:54 +0800
Subject: [Buildroot] [PATCH] ccid: bump to version 1.4.12
Message-ID: <1381284174.27485.9.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version and also add license information.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/ccid/ccid.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index a246ddd..c25b433 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.4.8
+CCID_VERSION = 1.4.12
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
-CCID_SITE = http://alioth.debian.org/frs/download.php/file/3768
+CCID_SITE = http://alioth.debian.org/frs/download.php/file/3937
+CCID_LICENSE = LGPLv2.1+
+CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
 CCID_DEPENDENCIES = pcsc-lite host-pkgconf libusb
 
-- 
1.8.1.2
