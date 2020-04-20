From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 20 Apr 2020 08:07:15 +0200
Subject: [Buildroot] [PATCH] package/lua-utf8: bump to version 0.1.2
Message-ID: <20200420060715.31260-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

switch of rocks maintainer
from https://luarocks.org/modules/dannote/utf8
to https://luarocks.org/modules/xavier-wang/luautf8

the upstream author stays http://github.com/starwing/luautf8

now, the version scheme is aligned on the upstream one,
and the version 0.1.2 was released on 06 Apr 2020.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-utf8/lua-utf8.hash | 3 ++-
 package/lua-utf8/lua-utf8.mk   | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/lua-utf8/lua-utf8.hash b/package/lua-utf8/lua-utf8.hash
index e119f9435..28cdfb397 100644
--- a/package/lua-utf8/lua-utf8.hash
+++ b/package/lua-utf8/lua-utf8.hash
@@ -1,2 +1,3 @@
 # computed by luarocks/buildroot
-sha256 c9ceb3a9f327b3215cdf959eebf616970b5b0427ca3fde05b19f8236defa4b91  utf8-1.2-0.src.rock
+sha256 b6f16ea49232b212870ab0612a8188d8956fdf6369835e3ae7df517550be18e0  luautf8-0.1.2-2.src.rock
+sha256 74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.1.2/LICENSE
diff --git a/package/lua-utf8/lua-utf8.mk b/package/lua-utf8/lua-utf8.mk
index 7ed4f3fbe..9799f4098 100644
--- a/package/lua-utf8/lua-utf8.mk
+++ b/package/lua-utf8/lua-utf8.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LUA_UTF8_VERSION = 1.2-0
-LUA_UTF8_NAME_UPSTREAM = utf8
-LUA_UTF8_SUBDIR = luautf8
+LUA_UTF8_VERSION = 0.1.2-2
+LUA_UTF8_NAME_UPSTREAM = luautf8
 LUA_UTF8_LICENSE = MIT
+LUA_UTF8_LICENSE_FILES = $(LUA_UTF8_SUBDIR)/LICENSE
 
 $(eval $(luarocks-package))
-- 
2.20.1
