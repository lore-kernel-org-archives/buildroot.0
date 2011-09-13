From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 13 Sep 2011 23:44:59 +0200
Subject: [Buildroot] [git commit] lzop : bump to 1.03
Message-ID: <20110913214742.A888A8D59E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=307c006695f24621a8e515f85d0cbbe4374afd89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lzop/lzop.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index e55c105..b278e59 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -3,9 +3,9 @@
 # lzop
 #
 #############################################################
-LZOP_VERSION:=1.02rc1
-LZOP_SOURCE:=lzop-$(LZOP_VERSION).tar.gz
-LZOP_SITE:=http://www.lzop.org/download/
-LZOP_DEPENDENCIES:=lzo
+LZOP_VERSION = 1.03
+LZOP_SOURCE = lzop-$(LZOP_VERSION).tar.gz
+LZOP_SITE = http://www.lzop.org/download/
+LZOP_DEPENDENCIES = lzo
 
 $(eval $(call AUTOTARGETS,package,lzop))
-- 
1.7.3.4
