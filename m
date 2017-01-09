From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jan 2017 17:18:19 +0100
Subject: [Buildroot] [git commit] lua-messagepack: bump version to 0.4.0
Message-ID: <20170109163505.5E1A181770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06ecfbaf1ee723342e8ebc3622dbf1770b3294ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-messagepack/lua-messagepack.hash | 4 ++--
 package/lua-messagepack/lua-messagepack.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-messagepack/lua-messagepack.hash b/package/lua-messagepack/lua-messagepack.hash
index d5858db..7da34e1 100644
--- a/package/lua-messagepack/lua-messagepack.hash
+++ b/package/lua-messagepack/lua-messagepack.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	706e99424cfd4d86deed10764fb2d0094bac006c0c5be449470992e9f0779ffa  lua-messagepack-0.3.6-1.src.rock
-sha256	d3a82aea6423213f399735b291a6887b230fb3bb9bcfe7b530532f1756308566  lua-messagepack-lua53-0.3.6-1.src.rock
+sha256 a8aac195dc835101a025385b4c5b596de6602c4ced85e0df35b7f52e6aa6ee5d  lua-messagepack-0.4.0-1.src.rock
+sha256 85a3eef21e10eb6c3ebf584ce950610fc10457746a4b8dbcbcab4b626f7d3265  lua-messagepack-lua53-0.4.0-1.src.rock
diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
index 4bd3fdd..15fc182 100644
--- a/package/lua-messagepack/lua-messagepack.mk
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.3.6
+LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.4.0
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_MESSAGEPACK_VERSION = lua53-$(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
 else
