From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 25 Jul 2014 20:21:24 +0200
Subject: [Buildroot] [PATCH 1/2] luarocks: bump to version 2.2.0beta1
Message-ID: <1406312485-2893-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this version includes a new default repository for rocks

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 Config.in                    | 2 +-
 package/luarocks/luarocks.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index b169678..dd8073d 100644
--- a/Config.in
+++ b/Config.in
@@ -234,7 +234,7 @@ endif
 
 config BR2_LUAROCKS_MIRROR
 	string "LuaRocks mirror"
-	default "http://luarocks.org/repositories/rocks"
+	default "http://rocks.moonscript.org"
 	help
 	  LuaRocks repository.
 
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 926fd04..19c1c94 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 2.1.2
+LUAROCKS_VERSION = 2.2.0beta1
 LUAROCKS_SITE = http://luarocks.org/releases/
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
1.9.1
