From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 07 Oct 2013 18:35:56 +0800
Subject: [Buildroot] [PATCH] minicom: bump to version 2.6.2
Message-ID: <1381142156.7602.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/minicom/minicom.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index d46376e..05004b8 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 2.6.1
-MINICOM_SITE = http://alioth.debian.org/frs/download.php/file/3700/
+MINICOM_VERSION = 2.6.2
+MINICOM_SITE = http://alioth.debian.org/frs/download.php/file/3869/
 MINICOM_LICENSE = GPLv2+
 MINICOM_LICENSE_FILES = COPYING
 
-- 
1.8.1.2
