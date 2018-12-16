From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 16 Dec 2018 09:56:53 +0100
Subject: [Buildroot] [PATCH 09/12] lua-stdlib: bump to version 41.2.2
In-Reply-To: <20181216085656.30105-1-francois.perrad@gadz.org>
References: <20181216085656.30105-1-francois.perrad@gadz.org>
Message-ID: <20181216085656.30105-9-francois.perrad@gadz.org>
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
index 4882bf1e7..e0eadfb24 100644
--- a/package/lua-stdlib/lua-stdlib.hash
+++ b/package/lua-stdlib/lua-stdlib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 b7302ecc8ea3992d3bad96c0c4d56272e38d786d16cc1ad5964fefa73fd7c10b  stdlib-41.2.1-1.src.rock
+sha256 67eadaccbb2b6037ea70129f9616da49eaeeaf1477652a8e2cc77740286531cf  stdlib-41.2.2-1.src.rock
diff --git a/package/lua-stdlib/lua-stdlib.mk b/package/lua-stdlib/lua-stdlib.mk
index a7930be5d..bf90116e4 100644
--- a/package/lua-stdlib/lua-stdlib.mk
+++ b/package/lua-stdlib/lua-stdlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_STDLIB_VERSION_UPSTREAM = 41.2.1
+LUA_STDLIB_VERSION_UPSTREAM = 41.2.2
 LUA_STDLIB_VERSION = $(LUA_STDLIB_VERSION_UPSTREAM)-1
 LUA_STDLIB_NAME_UPSTREAM = stdlib
 LUA_STDLIB_SUBDIR = lua-stdlib-release-v$(LUA_STDLIB_VERSION_UPSTREAM)
-- 
2.17.1
