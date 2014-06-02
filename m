From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 12:46:07 +0200
Subject: [Buildroot] [git commit] package/w_scan: bump version
Message-ID: <20140602111141.75AEE9CE7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb7a0a8117e460b1b2f6d4eb21b5749b4923c6d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/w_scan/w_scan.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/w_scan/w_scan.mk b/package/w_scan/w_scan.mk
index 86bd34e..44f3193 100644
--- a/package/w_scan/w_scan.mk
+++ b/package/w_scan/w_scan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-W_SCAN_VERSION = 20130331
+W_SCAN_VERSION = 20140118
 W_SCAN_SOURCE = w_scan-$(W_SCAN_VERSION).tar.bz2
 W_SCAN_SITE = http://wirbel.htpc-forum.de/w_scan
 W_SCAN_LICENSE = GPLv2+
