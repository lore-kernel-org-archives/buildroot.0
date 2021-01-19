From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 18:50:59 +0100
Subject: [Buildroot] [git commit] package/lua-bit32: bump to version 5.3.5.1
Message-ID: <20210119173252.9934481504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb299e91b38ea29bec354dcc8d82bf07b1e74f76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-bit32/lua-bit32.hash | 4 ++--
 package/lua-bit32/lua-bit32.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-bit32/lua-bit32.hash b/package/lua-bit32/lua-bit32.hash
index ea9aca19a3..9a4f64b66c 100644
--- a/package/lua-bit32/lua-bit32.hash
+++ b/package/lua-bit32/lua-bit32.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 5d820979918637c2b86e1b0a55002bcfc2fa649469bc50e47aa954ea9fde499d  bit32-5.3.5-1.src.rock
-sha256 1b24f475812c979684fb3469f6faccbdc7c33c9d39421728aa0d78deda5a89a5  lua-compat-5.3-0.9/LICENSE
+sha256 0e273427f2b877270f9cec5642ebe2670242926ba9638d4e6df7e4e1263ca12c  bit32-5.3.5.1-1.src.rock
+sha256 1b24f475812c979684fb3469f6faccbdc7c33c9d39421728aa0d78deda5a89a5  lua-compat-5.3-0.10/LICENSE
diff --git a/package/lua-bit32/lua-bit32.mk b/package/lua-bit32/lua-bit32.mk
index c254cffd87..0fa5048d79 100644
--- a/package/lua-bit32/lua-bit32.mk
+++ b/package/lua-bit32/lua-bit32.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LUA_BIT32_VERSION = 5.3.5-1
+LUA_BIT32_VERSION = 5.3.5.1-1
 LUA_BIT32_NAME_UPSTREAM = bit32
-LUA_BIT32_SUBDIR = lua-compat-5.3-0.9
+LUA_BIT32_SUBDIR = lua-compat-5.3-0.10
 LUA_BIT32_LICENSE = MIT
 LUA_BIT32_LICENSE_FILES = $(LUA_BIT32_SUBDIR)/LICENSE
 
