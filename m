From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 00:21:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/odhcp6c: bump version to fix musl
	build
Message-ID: <1453591294-24061-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autobuilders did not catch the error yet because they failed
earlier with other packages, but I am continuing the build using
the defconfig from:
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/odhcp6c/odhcp6c.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
index 47944f1..c841cd3 100644
--- a/package/odhcp6c/odhcp6c.mk
+++ b/package/odhcp6c/odhcp6c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ODHCP6C_VERSION = 8d9b60fb496000988f3633951f2e30380fc2de50
+ODHCP6C_VERSION = dc186d6d2b0dd4ad23ca5fc69c00e81f796ff6d9
 ODHCP6C_SITE = $(call github,sbyx,odhcp6c,$(ODHCP6C_VERSION))
 ODHCP6C_LICENSE = GPLv2
 ODHCP6C_LICENSE_FILES = COPYING
-- 
2.7.0.rc3
