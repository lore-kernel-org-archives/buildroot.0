From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jan 2018 08:35:29 +0100
Subject: [Buildroot] [git commit] lua-csnappy: bump to version 0.1.5
Message-ID: <20180123073700.2CDFD83FC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=beb6f83b2df53d292a01cb0916a52e88de008b1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-csnappy/lua-csnappy.hash | 2 +-
 package/lua-csnappy/lua-csnappy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-csnappy/lua-csnappy.hash b/package/lua-csnappy/lua-csnappy.hash
index 1363634..f887426 100644
--- a/package/lua-csnappy/lua-csnappy.hash
+++ b/package/lua-csnappy/lua-csnappy.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	855331feb8e09a32eea8366ab9bcd4386db6392de82383f08ae5e59adbb7d8a6  lua-csnappy-0.1.4-1.src.rock
+sha256	4fc373ba714cb8b428e9971f1725d82de6a43dfea361a0b7894e4762238dc95c  lua-csnappy-0.1.5-1.src.rock
diff --git a/package/lua-csnappy/lua-csnappy.mk b/package/lua-csnappy/lua-csnappy.mk
index 3325f1f..cba0a06 100644
--- a/package/lua-csnappy/lua-csnappy.mk
+++ b/package/lua-csnappy/lua-csnappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CSNAPPY_VERSION = 0.1.4-1
+LUA_CSNAPPY_VERSION = 0.1.5-1
 LUA_CSNAPPY_LICENSE = BSD-3-Clause
 LUA_CSNAPPY_LICENSE_FILES = $(LUA_CSNAPPY_SUBDIR)/COPYRIGHT
 
