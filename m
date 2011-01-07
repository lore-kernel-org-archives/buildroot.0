From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Jan 2011 17:12:56 -0300
Subject: [Buildroot] [PATCH 07/13] hdparm: bump to version 9.36
In-Reply-To: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
References: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1294431182-27793-7-git-send-email-gustavo@zacarias.com.ar>
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
index 02d76a9..4e3cfe5 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -3,7 +3,7 @@
 # hdparm
 #
 #############################################################
-HDPARM_VERSION = 9.32
+HDPARM_VERSION = 9.36
 HDPARM_SOURCE = hdparm-$(HDPARM_VERSION).tar.gz
 HDPARM_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/hdparm
 
-- 
1.7.2.2
