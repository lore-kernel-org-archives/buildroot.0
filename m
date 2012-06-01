From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 1 Jun 2012 18:00:36 +0200
Subject: [Buildroot] [PATCH] cgilua: bump version to 5.1.4
Message-ID: <CAB0FRssJAWfT-UDr941C5c_6Lb7oVjcQR_qyip2QywvyP1Z=3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
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
-- 
1.7.9.5
