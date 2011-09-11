From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] libconfuse: drop implied uClibc dependency
Message-ID: <20110912052629.DAF908D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=170fb5361d82bf1b0a71a7f8f87da1600a4c2a10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc doesn't need to be listed as an explicit pkg dependency.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libconfuse/libconfuse.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 28115d7..79ff687 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -11,6 +11,4 @@ LIBCONFUSE_INSTALL_STAGING = YES
 
 LIBCONFUSE_CONF_OPT = --disable-rpath
 
-LIBCONFUSE_DEPENDENCIES = uclibc
-
 $(eval $(call AUTOTARGETS,package,libconfuse))
-- 
1.7.3.4
