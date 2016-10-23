From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 23 Oct 2016 11:27:00 +0200
Subject: [Buildroot] [PATCH 2/2] lua-messagepack: bump to version 0.3.5
In-Reply-To: <20161023092700.28582-1-francois.perrad@gadz.org>
References: <20161023092700.28582-1-francois.perrad@gadz.org>
Message-ID: <20161023092700.28582-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-messagepack/lua-messagepack.hash | 4 ++--
 package/lua-messagepack/lua-messagepack.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-messagepack/lua-messagepack.hash b/package/lua-messagepack/lua-messagepack.hash
index b46b686..87e42d8 100644
--- a/package/lua-messagepack/lua-messagepack.hash
+++ b/package/lua-messagepack/lua-messagepack.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	be6827c93383c8d7214c9ac9b7a62ab04186db4c6c2a3a7b36036157784f58b8  lua-messagepack-0.3.4-1.src.rock
-sha256	5ab74601696973a66802de1fec614859db0d93d5fa960fac0f70cb04a490e5e5  lua-messagepack-lua53-0.3.4-1.src.rock
+sha256	7136e47a37f01960c244fe0ad42215e2cf6e96f50cb7292c5295fa3e93fd50c1  lua-messagepack-0.3.5-1.src.rock
+sha256	b8d1c3cff8eef0b8ef1a3287228cfac4149933744235d3a5d88d65d4e3b048bb  lua-messagepack-lua53-0.3.5-1.src.rock
diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
index 18a4e4a..f8cc132 100644
--- a/package/lua-messagepack/lua-messagepack.mk
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.3.4
+LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.3.5
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_MESSAGEPACK_VERSION = lua53-$(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
 else
-- 
2.9.3
