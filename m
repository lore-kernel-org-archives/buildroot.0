From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Jun 2013 23:34:31 +0200
Subject: [Buildroot] [git commit] luaexpatutils: fix file header
Message-ID: <20130619213644.03E289AF77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f17ccaf9c8e768d413352d8a6613e592dcb542f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/luaexpatutils/luaexpatutils.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luaexpatutils/luaexpatutils.mk b/package/luaexpatutils/luaexpatutils.mk
index 79578c0..7ce7fc5 100644
--- a/package/luaexpatutils/luaexpatutils.mk
+++ b/package/luaexpatutils/luaexpatutils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # luaexpatutils
 #
-#############################################################
+################################################################################
 
 LUAEXPATUTILS_VERSION = 88c228365b
 LUAEXPATUTILS_SITE = http://github.com/stevedonovan/LuaExpatUtils/tarball/$(LUAEXPATUTILS_VERSION)
