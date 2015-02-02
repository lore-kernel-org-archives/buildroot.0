From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 21:21:31 +0100
Subject: [Buildroot] [git commit] lua-testmore: bump to version 0.3.2
Message-ID: <20150202202159.D5D32805F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48bcabd0dc32dbddf6102f4adc51eeb6bbf848f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-testmore/lua-testmore.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lua-testmore/lua-testmore.mk b/package/lua-testmore/lua-testmore.mk
index c8c8d1f..771b97f 100644
--- a/package/lua-testmore/lua-testmore.mk
+++ b/package/lua-testmore/lua-testmore.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_TESTMORE_VERSION_UPSTREAM = 0.3.1
+LUA_TESTMORE_VERSION_UPSTREAM = 0.3.2
 LUA_TESTMORE_VERSION = $(LUA_TESTMORE_VERSION_UPSTREAM)-1
 LUA_TESTMORE_SUBDIR = lua-TestMore-$(LUA_TESTMORE_VERSION_UPSTREAM)
 LUA_TESTMORE_LICENSE = MIT
