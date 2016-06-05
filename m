From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 21:41:13 +0200
Subject: [Buildroot] [git commit] package/vpnc: bump version
Message-ID: <20160605200530.6F14F81E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=373930bd7d6342c257629b780d43de4e9c94bb71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vpnc/vpnc.hash | 2 +-
 package/vpnc/vpnc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vpnc/vpnc.hash b/package/vpnc/vpnc.hash
index c35f0d5..98a9847 100644
--- a/package/vpnc/vpnc.hash
+++ b/package/vpnc/vpnc.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 d71ae6a6c2801c6c21490227d29896ea75deade05fc38153de9ae07b25a6a60d  vpnc-024aa17a0a86716cac0db185b44bf07ba4f8c135.tar.gz
+sha256 c10a5c2c0813198ca2404dd36db380cdb6395b46338123b341775095cf61521d  vpnc-b1243d29e0c00312ead038b04a2cf5e2fa31d740.tar.gz
diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
index 62dedc6..282a422 100644
--- a/package/vpnc/vpnc.mk
+++ b/package/vpnc/vpnc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VPNC_VERSION = 024aa17a0a86716cac0db185b44bf07ba4f8c135
+VPNC_VERSION = b1243d29e0c00312ead038b04a2cf5e2fa31d740
 VPNC_SITE = $(call github,ndpgroup,vpnc,$(VPNC_VERSION))
 VPNC_LICENSE = GPLv2+
 VPNC_LICENSE_FILES = COPYING
