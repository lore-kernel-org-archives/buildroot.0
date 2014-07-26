From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:03:22 +0200
Subject: [Buildroot] [git commit] luarocks: bump to version 2.2.0beta1
Message-ID: <20140726070716.886989D302@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b8411afac3864a2a25a502ede791ccc8bd57aef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this version includes a new default repository for rocks

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                    |    2 +-
 package/luarocks/luarocks.mk |    2 +-
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
