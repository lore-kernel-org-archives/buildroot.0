From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  3 Mar 2016 22:12:45 +0100
Subject: [Buildroot] [PATCH 2/3] lua-messagepack: bump to version 0.3.4
In-Reply-To: <1457039566-3326-1-git-send-email-francois.perrad@gadz.org>
References: <1457039566-3326-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1457039566-3326-2-git-send-email-francois.perrad@gadz.org>
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
index e4a442d..b46b686 100644
--- a/package/lua-messagepack/lua-messagepack.hash
+++ b/package/lua-messagepack/lua-messagepack.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	7b173f90a7d1c473aa176de8358060e5e7d312c97c5add327007bf04709e0300  lua-messagepack-0.3.3-1.src.rock
-sha256	bd7d6e02d40b53ed143a8c7222c6ae0cbb7c7fd4fafda9c5f5326423d06ea25d  lua-messagepack-lua53-0.3.3-1.src.rock
+sha256	be6827c93383c8d7214c9ac9b7a62ab04186db4c6c2a3a7b36036157784f58b8  lua-messagepack-0.3.4-1.src.rock
+sha256	5ab74601696973a66802de1fec614859db0d93d5fa960fac0f70cb04a490e5e5  lua-messagepack-lua53-0.3.4-1.src.rock
diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
index d749473..18a4e4a 100644
--- a/package/lua-messagepack/lua-messagepack.mk
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.3.3
+LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.3.4
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_MESSAGEPACK_VERSION = lua53-$(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
 else
-- 
2.5.0
