From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  2 Oct 2012 14:40:48 -0300
Subject: [Buildroot] [PATCH 1/5] hdparm: bump to version 9.42
Message-ID: <1349199652-12928-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hdparm/hdparm.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index 5c00e79..76223f4 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -4,8 +4,10 @@
 #
 #############################################################
 
-HDPARM_VERSION = 9.39
+HDPARM_VERSION = 9.42
 HDPARM_SITE = http://downloads.sourceforge.net/project/hdparm/hdparm
+HDPARM_LICENSE = BSD-Style
+HDPARM_LICENSE_FILES = LICENSE.TXT
 
 define HDPARM_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-- 
1.7.8.6
