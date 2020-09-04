From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 09:13:56 +0200
Subject: [Buildroot] [git commit] package/lua-compat53: bump to version 0.8
Message-ID: <20200904070620.973AC81355@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea2cfc15e7597909afef7fa5d1091fc557f6d07d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-compat53/lua-compat53.hash | 4 ++--
 package/lua-compat53/lua-compat53.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-compat53/lua-compat53.hash b/package/lua-compat53/lua-compat53.hash
index b40596f86a..07783820cc 100644
--- a/package/lua-compat53/lua-compat53.hash
+++ b/package/lua-compat53/lua-compat53.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 cb5fdca362780a30405c4134310ea78627a092b0ee8445a52456f2fceeeaea4e  compat53-0.7-1.src.rock
-sha256 1b24f475812c979684fb3469f6faccbdc7c33c9d39421728aa0d78deda5a89a5  lua-compat-5.3-0.7/LICENSE
+sha256 e513e75ba0ef4923a1ec0d4f0beb5972a11cc9bd7ac1b0953b5e4f037b259c92  compat53-0.8-1.src.rock
+sha256 1b24f475812c979684fb3469f6faccbdc7c33c9d39421728aa0d78deda5a89a5  lua-compat-5.3-0.8/LICENSE
diff --git a/package/lua-compat53/lua-compat53.mk b/package/lua-compat53/lua-compat53.mk
index 13e24391b0..0e8f1c3600 100644
--- a/package/lua-compat53/lua-compat53.mk
+++ b/package/lua-compat53/lua-compat53.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_COMPAT53_VERSION_UPSTREAM = 0.7
+LUA_COMPAT53_VERSION_UPSTREAM = 0.8
 LUA_COMPAT53_VERSION = $(LUA_COMPAT53_VERSION_UPSTREAM)-1
 LUA_COMPAT53_NAME_UPSTREAM = compat53
 LUA_COMPAT53_SUBDIR = lua-compat-5.3-$(LUA_COMPAT53_VERSION_UPSTREAM)
