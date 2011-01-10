From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jan 2011 13:13:45 +0100
Subject: [Buildroot] [git commit master 1/1] ccache: bump version
Message-ID: <20110110131222.847A38A3BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0063c87c7e754b548a854655aff97ae5478e4c40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ccache/ccache.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 1d0a560..dd25b76 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-CCACHE_VERSION = 3.1.3
+CCACHE_VERSION = 3.1.4
 CCACHE_SITE    = http://samba.org/ftp/ccache
 CCACHE_SOURCE  = ccache-$(CCACHE_VERSION).tar.bz2
 
-- 
1.7.2.2
