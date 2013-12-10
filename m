From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 10 Dec 2013 14:58:25 +0800
Subject: [Buildroot] [PATCH] numactl: bump to version 2.0.9
Message-ID: <1386658705.19600.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/numactl/numactl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index ee62f73..c82ba4e 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUMACTL_VERSION = 2.0.8
+NUMACTL_VERSION = 2.0.9
 NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download/
 NUMACTL_LICENSE = LGPLv2.1 (libnuma), GPLv2 (programs)
 NUMACTL_LICENSE_FILES = README
-- 
1.8.1.2
