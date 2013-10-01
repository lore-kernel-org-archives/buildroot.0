From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 01 Oct 2013 10:32:32 +0800
Subject: [Buildroot] [PATCH 2/2] logrotate: bump to version 3.8.6
In-Reply-To: <1380594702.9353.1.camel@phoenix>
References: <1380594702.9353.1.camel@phoenix>
Message-ID: <1380594752.9353.2.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/logrotate/logrotate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index f5ef0b9..4bae431 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.8.4
+LOGROTATE_VERSION = 3.8.6
 LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.gz
 LOGROTATE_SITE = https://www.fedorahosted.org/releases/l/o/logrotate/
 LOGROTATE_LICENSE = GPLv2+
-- 
1.8.1.2
