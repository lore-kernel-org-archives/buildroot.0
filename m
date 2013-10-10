From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 10 Oct 2013 17:59:43 +0200
Subject: [Buildroot] [PATCH 1/1] ccid: bump to version 1.4.13
Message-ID: <1381420783-7701-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/ccid/ccid.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index c25b433..aabc0c0 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.4.12
+CCID_VERSION = 1.4.13
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
-CCID_SITE = http://alioth.debian.org/frs/download.php/file/3937
+CCID_SITE = http://alioth.debian.org/frs/download.php/file/3959
 CCID_LICENSE = LGPLv2.1+
 CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
-- 
1.7.9.5
