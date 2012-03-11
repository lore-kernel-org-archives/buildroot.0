From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Mar 2012 18:48:02 -0300
Subject: [Buildroot] [PATCH 13/20] hdparm: bump to version 9.39
In-Reply-To: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1331502489-5036-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hdparm/hdparm.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index abbb0c3..fb90ce2 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-HDPARM_VERSION = 9.38
+HDPARM_VERSION = 9.39
 HDPARM_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/hdparm
 
 define HDPARM_BUILD_CMDS
-- 
1.7.3.4
