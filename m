From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Jul 2021 21:42:12 +0200
Subject: [Buildroot] [git commit] package/lua-rotas: bump to version 0.2.1
Message-ID: <20210715190840.BA618883A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=5633f2fb7a5e733d2900aa5a372b4de88ef767c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff COPYPRIGHT:
-Copyright (C) 2018-2019 Francois Perrad.
+Copyright (C) 2018-2021 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-rotas/lua-rotas.hash | 4 ++--
 package/lua-rotas/lua-rotas.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-rotas/lua-rotas.hash b/package/lua-rotas/lua-rotas.hash
index 6f8d0df41e..2633f3b728 100644
--- a/package/lua-rotas/lua-rotas.hash
+++ b/package/lua-rotas/lua-rotas.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 be47e72ec703ffc319fe4fd539b531bbe8a8c0c52e0cc9774273028f1599a0cf  lua-rotas-0.2.0-1.src.rock
-sha256 4a7fdc0e44509d79c9bf18560cfb98368f70bb3832abe07e3cdba5c06466b0bb  lua-Rotas-0.2.0/COPYRIGHT
+sha256 a947026be3552cbf676a0cef36a618111712257d306cbd9d340ed8895a4cbd2b  lua-rotas-0.2.1-1.src.rock
+sha256 ac8bb87b7b5e803ae27510b9c6fd284f1b00e741258bc59fc78d3bc107d96fbb  lua-Rotas-0.2.1/COPYRIGHT
diff --git a/package/lua-rotas/lua-rotas.mk b/package/lua-rotas/lua-rotas.mk
index 6ace963a4b..84d6c9a582 100644
--- a/package/lua-rotas/lua-rotas.mk
+++ b/package/lua-rotas/lua-rotas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_ROTAS_VERSION = 0.2.0-1
+LUA_ROTAS_VERSION = 0.2.1-1
 LUA_ROTAS_NAME_UPSTREAM = lua-Rotas
 LUA_ROTAS_LICENSE = MIT
 LUA_ROTAS_LICENSE_FILES = $(LUA_ROTAS_SUBDIR)/COPYRIGHT
