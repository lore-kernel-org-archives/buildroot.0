From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 22:59:29 +0200
Subject: [Buildroot] [git commit] jsmin: fix github tarball to use commit id
Message-ID: <20130606211253.A4C139A9A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0f124f36a8616a1e0895b2eb9411a8459daa3c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jsmin/jsmin.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index 0e82008..bb65c6c 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -1,5 +1,5 @@
 JSMIN_VERSION = a9b4755
-JSMIN_SITE = http://github.com/douglascrockford/JSMin/tarball/master
+JSMIN_SITE = http://github.com/douglascrockford/JSMin/tarball/$(JSMIN_VERSION)
 
 define JSMIN_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
