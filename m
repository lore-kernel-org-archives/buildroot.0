From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 02 Jun 2013 21:19:09 -0000
Subject: [Buildroot] [git commit] luafilesystem: bump to version 1.6.2
Message-ID: <20130602212039.B76559A5A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a19a70b2e11676a02adecd245ef5acc28de57c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/luafilesystem/luafilesystem.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 8553212..d23fbce 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LUAFILESYSTEM_VERSION = 1.5.0
+LUAFILESYSTEM_VERSION = 1.6.2
 LUAFILESYSTEM_SITE = http://github.com/downloads/keplerproject/luafilesystem
 LUAFILESYSTEM_DEPENDENCIES = lua
 LUAFILESYSTEM_LICENSE = MIT
