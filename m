From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 31 Jan 2015 21:43:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/mcelog: bump version to v109
Message-ID: <1422737039-1786-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mcelog/mcelog.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index da338ba..5857403 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MCELOG_VERSION = v105
+MCELOG_VERSION = v109
 MCELOG_SITE = $(BR2_KERNEL_MIRROR)/scm/utils/cpu/mce/mcelog.git
 MCELOG_SITE_METHOD = git
 MCELOG_LICENSE = GPLv2
-- 
1.7.10.4
