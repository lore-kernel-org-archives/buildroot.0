From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] tar: bump to 1.26
Message-ID: <20110912052631.BDCFC8D591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dba4b184318450435e3c5efd0b1955edbece8feb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tar/tar.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index e1e16a2..bab2ca2 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-TAR_VERSION = 1.25
+TAR_VERSION = 1.26
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
 
 $(eval $(call AUTOTARGETS,package,tar))
-- 
1.7.3.4
