From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Fri,  3 Aug 2012 17:45:04 +0800
Subject: [Buildroot]  [PATCH 1/3] lmbench: Add license info
Message-ID: <1343987106-3302-1-git-send-email-keguang.zhang@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license info for lmbench.
---
 package/lmbench/lmbench.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index bccb2de..3d3c3da 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -6,6 +6,8 @@
 LMBENCH_VERSION:=3.0-a9
 LMBENCH_SOURCE:=lmbench-$(LMBENCH_VERSION).tgz
 LMBENCH_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/lmbench/development/lmbench-3.0-a9/
+LMBENCH_LICENSE = GPLv2
+LMBENCH_LICENSE_FILES = COPYING
 
 define LMBENCH_CONFIGURE_CMDS
 	$(call CONFIG_UPDATE,$(@D))
-- 
1.7.1
