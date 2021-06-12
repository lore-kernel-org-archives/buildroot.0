From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 12 Jun 2021 23:49:05 +0200
Subject: [Buildroot] [PATCH] package/lua-livr: bump to version 0.2.2
Message-ID: <20210612214906.2876762-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff COPYRIGHT:
- Copyright (C) 2018-2019 Francois Perrad.
+ Copyright (C) 2018-2021 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-livr/lua-livr.hash | 4 ++--
 package/lua-livr/lua-livr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-livr/lua-livr.hash b/package/lua-livr/lua-livr.hash
index a891420b4..73b0fefa7 100644
--- a/package/lua-livr/lua-livr.hash
+++ b/package/lua-livr/lua-livr.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 a3890301ed5f393b585cab26ac944eddc9df41bfa2ab87c11785925193453493  lua-livr-0.2.1-1.src.rock
-sha256 8f09089acf52cfabcc2a44ec3a492dc261e0ae9df3c618f43b33805e696e02d8  lua-LIVR-0.2.1/COPYRIGHT
+sha256 e2f39316b8a1e66420c56e8ddc9ce4c0118c1a240582f2ba52d7627da6dfb76d  lua-livr-0.2.2-1.src.rock
+sha256 69fd426251454ea43a8068e58ac25d882922372de6b22e249bb56e00ea2cd834  lua-LIVR-0.2.2/COPYRIGHT
diff --git a/package/lua-livr/lua-livr.mk b/package/lua-livr/lua-livr.mk
index 25034b897..3f114c725 100644
--- a/package/lua-livr/lua-livr.mk
+++ b/package/lua-livr/lua-livr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LIVR_VERSION = 0.2.1-1
+LUA_LIVR_VERSION = 0.2.2-1
 LUA_LIVR_NAME_UPSTREAM = lua-LIVR
 LUA_LIVR_LICENSE = MIT
 LUA_LIVR_LICENSE_FILES = $(LUA_LIVR_SUBDIR)/COPYRIGHT
-- 
2.30.2
