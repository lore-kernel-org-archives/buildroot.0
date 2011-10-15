From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Oct 2011 23:03:18 +0200
Subject: [Buildroot] [git commit] which: style cleanup
Message-ID: <20111015213654.A3AEE800FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8684494837ca9dee7defe84cbc6079a593cf2ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/which/which.mk |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/which/which.mk b/package/which/which.mk
index 628711d..a7bb577 100644
--- a/package/which/which.mk
+++ b/package/which/which.mk
@@ -3,11 +3,8 @@
 # which
 #
 #############################################################
-WHICH_VERSION:=2.20
-WHICH_SOURCE:=which-$(WHICH_VERSION).tar.gz
-WHICH_SITE:=http://www.xs4all.nl/~carlo17/which/
-WHICH_AUTORECONF:=NO
-WHICH_INSTALL_STAGING:=NO
-WHICH_INSTALL_TARGET:=YES
+
+WHICH_VERSION = 2.20
+WHICH_SITE = http://carlo17.home.xs4all.nl/which
 
 $(eval $(call AUTOTARGETS))
