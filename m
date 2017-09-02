From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 22:02:31 +0200
Subject: [Buildroot] [git commit] lua-stdlib: bump to version 41.2.1
Message-ID: <20170902195515.228F38041D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39d98970c437decd8621b5a8dd345f5ae612d40a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-stdlib/lua-stdlib.hash | 2 +-
 package/lua-stdlib/lua-stdlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-stdlib/lua-stdlib.hash b/package/lua-stdlib/lua-stdlib.hash
index 56f585d..4882bf1 100644
--- a/package/lua-stdlib/lua-stdlib.hash
+++ b/package/lua-stdlib/lua-stdlib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	5eff1af3a16470297fa5a92c9525ae593644ae9dc0e6215158298711f5d829ee  stdlib-41.2.0-1.src.rock
+sha256 b7302ecc8ea3992d3bad96c0c4d56272e38d786d16cc1ad5964fefa73fd7c10b  stdlib-41.2.1-1.src.rock
diff --git a/package/lua-stdlib/lua-stdlib.mk b/package/lua-stdlib/lua-stdlib.mk
index f7fb0ff..a7930be 100644
--- a/package/lua-stdlib/lua-stdlib.mk
+++ b/package/lua-stdlib/lua-stdlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_STDLIB_VERSION_UPSTREAM = 41.2.0
+LUA_STDLIB_VERSION_UPSTREAM = 41.2.1
 LUA_STDLIB_VERSION = $(LUA_STDLIB_VERSION_UPSTREAM)-1
 LUA_STDLIB_NAME_UPSTREAM = stdlib
 LUA_STDLIB_SUBDIR = lua-stdlib-release-v$(LUA_STDLIB_VERSION_UPSTREAM)
