From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 29 Oct 2014 15:02:52 +0200
Subject: [Buildroot] [PATCH] nuttcp: update download link and homepage
Message-ID: <01921516b3b2a7684f35da5926d7b53ad2f80428.1414587772.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/9b3/9b335d93fd1dba87a5c30923718e137f28b46867/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/nuttcp/Config.in | 2 +-
 package/nuttcp/nuttcp.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nuttcp/Config.in b/package/nuttcp/Config.in
index eea88fd4e521..0b5f0811a5d2 100644
--- a/package/nuttcp/Config.in
+++ b/package/nuttcp/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_NUTTCP
 	help
 	  nuttcp is a TCP/UDP network testing tool, much like iperf
 
-	  http://www.lcp.nrl.navy.mil/nuttcp/nuttcp.html
+	  http://nuttcp.net
diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
index 3953baa13aa1..455875a8238b 100644
--- a/package/nuttcp/nuttcp.mk
+++ b/package/nuttcp/nuttcp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NUTTCP_VERSION = 6.1.2
-NUTTCP_SITE = http://www.lcp.nrl.navy.mil/nuttcp
+NUTTCP_SITE = http://nuttcp.net/nuttcp
 NUTTCP_SOURCE = nuttcp-$(NUTTCP_VERSION).tar.bz2
 NUTTCP_LICENSE = GPLv2
 NUTTCP_LICENSE_FILES = LICENSE
-- 
2.1.1
