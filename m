From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 23:50:30 +0200
Subject: [Buildroot] [git commit] wf111: bump to 5.2.2-r2
Message-ID: <20160425220245.914A0819A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47b9c8ae2265179bd215742fda5f572e1b1aa394
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This revision fixes the build with recent kernel versions, which have
seen changes in the MMC framework breaking the build of external SDIO
drivers.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wf111/wf111.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wf111/wf111.mk b/package/wf111/wf111.mk
index 6e50f40..e17e846 100644
--- a/package/wf111/wf111.mk
+++ b/package/wf111/wf111.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WF111_VERSION = 5.2.2-r1
+WF111_VERSION = 5.2.2-r2
 WF111_SITE_METHOD = file
 WF111_SITE = $(call qstrip,$(BR2_PACKAGE_WF111_TARBALL_PATH))
 WF111_DEPENDENCIES = linux
