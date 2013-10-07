From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 07 Oct 2013 13:51:25 +0800
Subject: [Buildroot] [PATCH] ortp: bump to version 0.22.0
Message-ID: <1381125085.28461.4.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/ortp/ortp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
index 5ccc5ff..513be9b 100644
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORTP_VERSION = 0.20.0
+ORTP_VERSION = 0.22.0
 ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
 ORTP_CONF_OPT = --disable-strict
 ORTP_INSTALL_STAGING = YES
-- 
1.8.1.2
