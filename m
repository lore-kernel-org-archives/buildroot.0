From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 30 Jun 2012 23:37:30 +0200
Subject: [Buildroot] [git commit] cgilua: bump version to 5.1.4
Message-ID: <20120630215452.D52128F39F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6ef9dd63d63c98d8c8f2cc0ada207944ee2dd69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cgilua/Config.in |    2 +-
 package/cgilua/cgilua.mk |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cgilua/Config.in b/package/cgilua/Config.in
index b43ba97..2f9c452 100644
--- a/package/cgilua/Config.in
+++ b/package/cgilua/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_CGILUA
 	  CGILua is a tool for creating dynamic HTML pages
 	  and manipulating input data from Web forms.
 
-	  http://luaforge.net/projects/cgilua/
+	  http://keplerproject.github.com/cgilua
diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index d46c2a6..8e5770a 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-CGILUA_VERSION = 5.1.3
-CGILUA_SITE = http://luaforge.net/frs/download.php/3970
+CGILUA_VERSION = 5.1.4
+CGILUA_SITE = http://github.com/downloads/keplerproject/cgilua
 CGILUA_DEPENDENCIES = luafilesystem
 
 define CGILUA_INSTALL_TARGET_CMDS
