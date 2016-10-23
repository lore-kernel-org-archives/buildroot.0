From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Oct 2016 14:39:48 +0200
Subject: [Buildroot] [git commit] lua-csnappy: bump to version 0.1.4
Message-ID: <20161023123956.63FA5819EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4419eb90423d0fad999b0d7e3d6bc9fc7f85e18f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-csnappy/lua-csnappy.hash | 2 +-
 package/lua-csnappy/lua-csnappy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-csnappy/lua-csnappy.hash b/package/lua-csnappy/lua-csnappy.hash
index 2864c3f..1363634 100644
--- a/package/lua-csnappy/lua-csnappy.hash
+++ b/package/lua-csnappy/lua-csnappy.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	3504789c7832f4ed3d7aef47ba9d62940985cde7556284db2233842bfb7d8876  lua-csnappy-0.1.3-1.src.rock
+sha256	855331feb8e09a32eea8366ab9bcd4386db6392de82383f08ae5e59adbb7d8a6  lua-csnappy-0.1.4-1.src.rock
diff --git a/package/lua-csnappy/lua-csnappy.mk b/package/lua-csnappy/lua-csnappy.mk
index 60b92ac..0739259 100644
--- a/package/lua-csnappy/lua-csnappy.mk
+++ b/package/lua-csnappy/lua-csnappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CSNAPPY_VERSION_UPSTREAM = 0.1.3
+LUA_CSNAPPY_VERSION_UPSTREAM = 0.1.4
 LUA_CSNAPPY_VERSION = $(LUA_CSNAPPY_VERSION_UPSTREAM)-1
 LUA_CSNAPPY_SUBDIR = lua-csnappy-$(LUA_CSNAPPY_VERSION_UPSTREAM)
 LUA_CSNAPPY_LICENSE = BSD-3c
