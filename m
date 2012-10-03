From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Oct 2012 23:59:21 +0200
Subject: [Buildroot] [git commit] hdparm: bump to version 9.42
Message-ID: <20121003220359.730A7997A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f78b189a024f62eb4865a04094dc44e9cf3bac3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
