From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 22:23:30 +0100
Subject: [Buildroot] [git commit] hdparm: bump to version 9.38
Message-ID: <20120126212542.6E49E9058C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4280ff8f05735be43bb2a624d33e9e8deba3164
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hdparm/hdparm.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index d19dff0..abbb0c3 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -3,8 +3,8 @@
 # hdparm
 #
 #############################################################
-HDPARM_VERSION = 9.36
-HDPARM_SOURCE = hdparm-$(HDPARM_VERSION).tar.gz
+
+HDPARM_VERSION = 9.38
 HDPARM_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/hdparm
 
 define HDPARM_BUILD_CMDS
