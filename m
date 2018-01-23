From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jan 2018 08:35:20 +0100
Subject: [Buildroot] [git commit] lua-coatpersistent: bump to version 0.2.2
Message-ID: <20180123073700.180CC83FC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc9b7158a9ab04fd9da6d5484c0c363f939f00e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-coatpersistent/lua-coatpersistent.hash | 4 ++--
 package/lua-coatpersistent/lua-coatpersistent.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-coatpersistent/lua-coatpersistent.hash b/package/lua-coatpersistent/lua-coatpersistent.hash
index ddd3c9b..eeb13bb 100644
--- a/package/lua-coatpersistent/lua-coatpersistent.hash
+++ b/package/lua-coatpersistent/lua-coatpersistent.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	46f5a1988a47b988d729df2937589756d989df7c26dac6aaf2a331a7b15bf7cf  lua-coatpersistent-lsqlite3-0.2.1-1.src.rock
-sha256	8053428fa7a6229d70ae161ec55a24b28c210078ac494161d48b6bf74ed000ca  lua-coatpersistent-luasql-0.2.1-1.src.rock
+sha256	e718ee36a17312108f266e8412f840db150afd89e8587d36e685673fff65f142  lua-coatpersistent-lsqlite3-0.2.2-1.src.rock
+sha256	5d36d6a8b413a2d56a466a45314291a0265c514a179e741b3fc95f4dd901abe6  lua-coatpersistent-luasql-0.2.2-1.src.rock
diff --git a/package/lua-coatpersistent/lua-coatpersistent.mk b/package/lua-coatpersistent/lua-coatpersistent.mk
index be8a4da..68c6083 100644
--- a/package/lua-coatpersistent/lua-coatpersistent.mk
+++ b/package/lua-coatpersistent/lua-coatpersistent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_COATPERSISTENT_VERSION_UPSTREAM = 0.2.1
+LUA_COATPERSISTENT_VERSION_UPSTREAM = 0.2.2
 ifeq ($(BR2_PACKAGE_LSQLITE3),y)
 LUA_COATPERSISTENT_VERSION = lsqlite3-$(LUA_COATPERSISTENT_VERSION_UPSTREAM)-1
 else
