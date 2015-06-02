From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 22:48:14 +0200
Subject: [Buildroot] [git commit] lua-csnappy: bump to version 0.1.3
Message-ID: <20150602205021.DAB4680187@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9d84ce80166eb671a0bc116c0ea352186c52624
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-csnappy/lua-csnappy.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lua-csnappy/lua-csnappy.mk b/package/lua-csnappy/lua-csnappy.mk
index b739abc..60b92ac 100644
--- a/package/lua-csnappy/lua-csnappy.mk
+++ b/package/lua-csnappy/lua-csnappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CSNAPPY_VERSION_UPSTREAM = 0.1.2
+LUA_CSNAPPY_VERSION_UPSTREAM = 0.1.3
 LUA_CSNAPPY_VERSION = $(LUA_CSNAPPY_VERSION_UPSTREAM)-1
 LUA_CSNAPPY_SUBDIR = lua-csnappy-$(LUA_CSNAPPY_VERSION_UPSTREAM)
 LUA_CSNAPPY_LICENSE = BSD-3c
