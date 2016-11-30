From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 22:10:38 +0100
Subject: [Buildroot] [git commit branch/next] lua-messagepack: bump to
	version 0.3.6
Message-ID: <20161130211427.06A8F80265@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35f10cd5baf555b7d2a22d954ea50ffb85e738f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-messagepack/lua-messagepack.hash | 4 ++--
 package/lua-messagepack/lua-messagepack.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-messagepack/lua-messagepack.hash b/package/lua-messagepack/lua-messagepack.hash
index 87e42d8..d5858db 100644
--- a/package/lua-messagepack/lua-messagepack.hash
+++ b/package/lua-messagepack/lua-messagepack.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	7136e47a37f01960c244fe0ad42215e2cf6e96f50cb7292c5295fa3e93fd50c1  lua-messagepack-0.3.5-1.src.rock
-sha256	b8d1c3cff8eef0b8ef1a3287228cfac4149933744235d3a5d88d65d4e3b048bb  lua-messagepack-lua53-0.3.5-1.src.rock
+sha256	706e99424cfd4d86deed10764fb2d0094bac006c0c5be449470992e9f0779ffa  lua-messagepack-0.3.6-1.src.rock
+sha256	d3a82aea6423213f399735b291a6887b230fb3bb9bcfe7b530532f1756308566  lua-messagepack-lua53-0.3.6-1.src.rock
diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
index f8cc132..4bd3fdd 100644
--- a/package/lua-messagepack/lua-messagepack.mk
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.3.5
+LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.3.6
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_MESSAGEPACK_VERSION = lua53-$(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
 else
