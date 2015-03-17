From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 18 Mar 2015 00:05:04 +0100
Subject: [Buildroot] [PATCH] package/mcelog: bump version to v111
Message-ID: <1426633504-3190-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since v110, mcelog detect Atom's cpuids.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/mcelog/mcelog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index 5857403..1290e34 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MCELOG_VERSION = v109
+MCELOG_VERSION = v111
 MCELOG_SITE = $(BR2_KERNEL_MIRROR)/scm/utils/cpu/mce/mcelog.git
 MCELOG_SITE_METHOD = git
 MCELOG_LICENSE = GPLv2
-- 
1.9.3
