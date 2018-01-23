From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jan 2018 08:35:42 +0100
Subject: [Buildroot] [git commit] lua-testmore: bump to version 0.3.3
Message-ID: <20180123073700.5F52E80426@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec3d655aa39086daeab49c57b7859ce1cd349f92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-testmore/lua-testmore.hash | 2 +-
 package/lua-testmore/lua-testmore.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-testmore/lua-testmore.hash b/package/lua-testmore/lua-testmore.hash
index 439097b..8db664f 100644
--- a/package/lua-testmore/lua-testmore.hash
+++ b/package/lua-testmore/lua-testmore.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a76a9b707487bf3e8b6a5362640bc2e010d184c4f66e423de7b28bd480a0db90  lua-testmore-0.3.2-1.src.rock
+sha256	163055ef92df9e01d9ae57cd45d6f6aace1ff4dd3abf7e29b9e30ecb1ab76ae2  lua-testmore-0.3.3-1.src.rock
diff --git a/package/lua-testmore/lua-testmore.mk b/package/lua-testmore/lua-testmore.mk
index 04482e2..7904776 100644
--- a/package/lua-testmore/lua-testmore.mk
+++ b/package/lua-testmore/lua-testmore.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_TESTMORE_VERSION = 0.3.2-1
+LUA_TESTMORE_VERSION = 0.3.3-1
 LUA_TESTMORE_NAME_UPSTREAM = lua-TestMore
 LUA_TESTMORE_LICENSE = MIT
 LUA_TESTMORE_LICENSE_FILES = $(LUA_TESTMORE_SUBDIR)/COPYRIGHT
