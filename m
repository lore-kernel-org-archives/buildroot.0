From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jan 2011 21:23:00 +0100
Subject: [Buildroot] [git commit master 1/1] hdparm: bump to version 9.36
Message-ID: <20110117202412.026CC8B382@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=15f088a115f58a38e35101bd6834718d30e77b62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
