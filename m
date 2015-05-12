From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 12 May 2015 13:19:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/mmc-utils: bump to latest commit
Message-ID: <1431429559-31351-1-git-send-email-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The changes are:

d0b4644 mmc-utils: add ability to enable/disable optional eMMC cache
64c2de8 mmc-utils: Add command to set the boot bus conditions
7891236 mmc-utils: add support to create gp partition
4afc8c8 mmc-utils: add check for max enhanced user area
50b6854 fix building errors on Android
f4eb241 Fit usage to 80 cols
c6cb053 mmc-utils: RPMB: add support for 4 rpmb operations
35c31fe mmc-utils: RPMB: add HMAC SHA256 support
a8276f5 fix make handling

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 package/mmc-utils/mmc-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index ca74298..82468bc 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = 11f2ceabc4ad3f0dd568e0ce68166e4803e0615b
+MMC_UTILS_VERSION = d0b46442b50794217e53b2455c1344c548d9d088
 MMC_UTILS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
 MMC_UTILS_LICENSE = GPLv2
 
-- 
2.0.5
