From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 18 Jul 2012 18:10:25 +0100
Subject: [Buildroot] [PATCH] libfreefare: bump version to 0.3.4
Message-ID: <1342631426-3229-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

This patch bumps the libfreefare package from version 0.3.2 to version 0.3.4.

Version 0.3.4 requires a minium libnfc version of 1.6. A separate patch has
been submitted to bump the libnfc version; that patch should be regarded as
a prerequisite for the present patch.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libfreefare/libfreefare.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 3f0036a..3c96839 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -3,7 +3,7 @@
 # libfreefare
 #
 #############################################################
-LIBFREEFARE_VERSION = 0.3.2
+LIBFREEFARE_VERSION = 0.3.4
 LIBFREEFARE_SITE = http://nfc-tools.googlecode.com/files
 LIBFREEFARE_DEPENDENCIES = libnfc openssl
 
-- 
1.7.9.5
