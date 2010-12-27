From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Dec 2010 21:32:05 +0100
Subject: [Buildroot] [git commit master 1/1] mrouted: use official tarball
	rather than git
Message-ID: <20101227203241.584808EB73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fcde2191fa97ee51ccfd64cde900cc1344f09b2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mrouted/mrouted.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index da4ef72..9ebb857 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -4,9 +4,9 @@
 #
 #
 #############################################################
-MROUTED_VERSION     = 3.9.4
-MROUTED_SITE        = https://github.com/troglobit/mrouted.git
-MROUTED_SITE_METHOD = git
+MROUTED_VERSION = 3.9.4
+MROUTED_SOURCE = mrouted-$(MROUTED_VERSION).tar.bz2
+MROUTED_SITE = http://ftp.vmlinux.org/pub/People/jocke/mrouted
 
 define MROUTED_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-- 
1.7.2.2
