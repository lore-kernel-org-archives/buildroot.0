From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 21:44:59 +0100
Subject: [Buildroot] [git commit] nuttcp: update download link and homepage
Message-ID: <20141029204506.B0756B1FA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24aab9f19598f30d6fe1928e36f6171b6e93594f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/9b3/9b335d93fd1dba87a5c30923718e137f28b46867/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nuttcp/Config.in |    2 +-
 package/nuttcp/nuttcp.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nuttcp/Config.in b/package/nuttcp/Config.in
index eea88fd..0b5f081 100644
--- a/package/nuttcp/Config.in
+++ b/package/nuttcp/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_NUTTCP
 	help
 	  nuttcp is a TCP/UDP network testing tool, much like iperf
 
-	  http://www.lcp.nrl.navy.mil/nuttcp/nuttcp.html
+	  http://nuttcp.net
diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
index 3953baa..455875a 100644
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
