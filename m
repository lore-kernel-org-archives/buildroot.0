From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  2 Sep 2017 18:56:38 +0200
Subject: [Buildroot] [PATCH 08/12] lua-stdlib: bump to version 41.2.1
In-Reply-To: <20170902165642.22943-1-francois.perrad@gadz.org>
References: <20170902165642.22943-1-francois.perrad@gadz.org>
Message-ID: <20170902165642.22943-8-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-stdlib/lua-stdlib.hash | 2 +-
 package/lua-stdlib/lua-stdlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-stdlib/lua-stdlib.hash b/package/lua-stdlib/lua-stdlib.hash
index 56f585db7..4882bf1e7 100644
--- a/package/lua-stdlib/lua-stdlib.hash
+++ b/package/lua-stdlib/lua-stdlib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	5eff1af3a16470297fa5a92c9525ae593644ae9dc0e6215158298711f5d829ee  stdlib-41.2.0-1.src.rock
+sha256 b7302ecc8ea3992d3bad96c0c4d56272e38d786d16cc1ad5964fefa73fd7c10b  stdlib-41.2.1-1.src.rock
diff --git a/package/lua-stdlib/lua-stdlib.mk b/package/lua-stdlib/lua-stdlib.mk
index f7fb0ff9c..a7930be5d 100644
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
-- 
2.11.0
