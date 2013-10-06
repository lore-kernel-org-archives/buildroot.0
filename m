From: Axel Lin <axel.lin@ingics.com>
Date: Sun, 06 Oct 2013 09:39:47 +0800
Subject: [Buildroot] [PATCH] socat: bump to version 2.0.0-b6
Message-ID: <1381023587.2508.3.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2.0.0-b6 fix a security issue:
Under certain circumstances an FD leak occurs and may be misused for denial of
service attacks against socat running in server mode.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/socat/socat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 8ba399b..df60961 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 2.0.0-b5
+SOCAT_VERSION = 2.0.0-b6
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download/
 SOCAT_LICENSE = GPLv2
-- 
1.8.1.2
