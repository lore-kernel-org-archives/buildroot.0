From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 14:32:04 +0100
Subject: [Buildroot] [git commit] lua-compat53: bump to version 0.7
Message-ID: <20181101133002.4B490846E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e122b4700ad68b96e842a3f19d34b444dd61d5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-compat53/lua-compat53.hash | 2 +-
 package/lua-compat53/lua-compat53.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-compat53/lua-compat53.hash b/package/lua-compat53/lua-compat53.hash
index 7f1e1bb22f..f311b9ce85 100644
--- a/package/lua-compat53/lua-compat53.hash
+++ b/package/lua-compat53/lua-compat53.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 fd0117156f59d1cb3824d5cca63be84c72cb5519b714377545433be3bb31afdf  compat53-0.5-1.src.rock
+sha256 cb5fdca362780a30405c4134310ea78627a092b0ee8445a52456f2fceeeaea4e  compat53-0.7-1.src.rock
diff --git a/package/lua-compat53/lua-compat53.mk b/package/lua-compat53/lua-compat53.mk
index 969f816393..13e24391b0 100644
--- a/package/lua-compat53/lua-compat53.mk
+++ b/package/lua-compat53/lua-compat53.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_COMPAT53_VERSION_UPSTREAM = 0.5
+LUA_COMPAT53_VERSION_UPSTREAM = 0.7
 LUA_COMPAT53_VERSION = $(LUA_COMPAT53_VERSION_UPSTREAM)-1
 LUA_COMPAT53_NAME_UPSTREAM = compat53
 LUA_COMPAT53_SUBDIR = lua-compat-5.3-$(LUA_COMPAT53_VERSION_UPSTREAM)
