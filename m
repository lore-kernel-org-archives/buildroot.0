From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Nov 2012 14:03:23 -0800
Subject: [Buildroot] [git commit] ccache: Bump version
Message-ID: <20121203145713.7E2D299808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd6c3d5fc769a1cd11e4f86147bc63103093fcdc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau@advansee.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ccache/ccache.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index b9c2039..1cbad6e 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-CCACHE_VERSION = 3.1.7
+CCACHE_VERSION = 3.1.8
 CCACHE_SITE    = http://samba.org/ftp/ccache
 CCACHE_SOURCE  = ccache-$(CCACHE_VERSION).tar.bz2
 
