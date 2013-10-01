From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 01 Oct 2013 14:36:34 +0800
Subject: [Buildroot] [PATCH] setserial: bump to version 2.17-45.3
Message-ID: <1380609394.20990.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to patchlevel 3 since 2 is gone upstream.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Fix below download error:
--2013-10-01 14:27:13--  http://ftp.debian.org/debian/pool/main/s/setserial/setserial_2.17-45.2.diff.gz
Resolving ftp.debian.org (ftp.debian.org)... 130.89.148.12, 2001:610:1908:b000::148:12
Connecting to ftp.debian.org (ftp.debian.org)|130.89.148.12|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2013-10-01 14:27:15 ERROR 404: Not Found.

 package/setserial/setserial.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index e6846b2..262cc79 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SETSERIAL_VERSION            = 2.17
-SETSERIAL_PATCH              = setserial_2.17-45.2.diff.gz
+SETSERIAL_PATCH              = setserial_2.17-45.3.diff.gz
 SETSERIAL_SOURCE             = setserial_$(SETSERIAL_VERSION).orig.tar.gz
 SETSERIAL_SITE               = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/setserial/
 
-- 
1.8.1.2
