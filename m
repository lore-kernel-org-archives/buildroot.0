From: Axel Lin <axel.lin@ingics.com>
Date: Sat, 14 Dec 2013 15:20:20 +0800
Subject: [Buildroot] [PATCH 1/2] ccid: bump to version 1.4.14
Message-ID: <1387005620.16935.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/ccid/ccid.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index aabc0c0..e337053 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.4.13
+CCID_VERSION = 1.4.14
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
-CCID_SITE = http://alioth.debian.org/frs/download.php/file/3959
+CCID_SITE = http://alioth.debian.org/frs/download.php/file/3967
 CCID_LICENSE = LGPLv2.1+
 CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
-- 
1.8.1.2
