From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 13 Nov 2012 12:56:49 +0000
Subject: [Buildroot] [PATCH] libnfc-llcp: bump version
Message-ID: <1352811409-5752-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libnfc-llcp/libnfc-llcp.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnfc-llcp/libnfc-llcp.mk b/package/libnfc-llcp/libnfc-llcp.mk
index 57821c1..0bff089 100644
--- a/package/libnfc-llcp/libnfc-llcp.mk
+++ b/package/libnfc-llcp/libnfc-llcp.mk
@@ -3,7 +3,7 @@
 # libnfc-llcp
 #
 #############################################################
-LIBNFC_LLCP_VERSION = 1090
+LIBNFC_LLCP_VERSION = 1103
 LIBNFC_LLCP_SITE = http://nfc-tools.googlecode.com/svn/trunk/libnfc-llcp/
 LIBNFC_LLCP_SITE_METHOD = svn
 LIBNFC_LLCP_DEPENDENCIES = libnfc
-- 
1.7.10.4
