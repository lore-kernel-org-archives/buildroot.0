From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:07:05 +0100
Subject: [Buildroot] [git commit] lua-stdlib: bump to version 41.2.2
Message-ID: <20181216110337.CE9AF7FDF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff4b4bec67dd8241e8955de518c88ad754d1349a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-stdlib/lua-stdlib.hash | 2 +-
 package/lua-stdlib/lua-stdlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-stdlib/lua-stdlib.hash b/package/lua-stdlib/lua-stdlib.hash
index 4882bf1e7c..e0eadfb246 100644
--- a/package/lua-stdlib/lua-stdlib.hash
+++ b/package/lua-stdlib/lua-stdlib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 b7302ecc8ea3992d3bad96c0c4d56272e38d786d16cc1ad5964fefa73fd7c10b  stdlib-41.2.1-1.src.rock
+sha256 67eadaccbb2b6037ea70129f9616da49eaeeaf1477652a8e2cc77740286531cf  stdlib-41.2.2-1.src.rock
diff --git a/package/lua-stdlib/lua-stdlib.mk b/package/lua-stdlib/lua-stdlib.mk
index a7930be5df..bf90116e4a 100644
--- a/package/lua-stdlib/lua-stdlib.mk
+++ b/package/lua-stdlib/lua-stdlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_STDLIB_VERSION_UPSTREAM = 41.2.1
+LUA_STDLIB_VERSION_UPSTREAM = 41.2.2
 LUA_STDLIB_VERSION = $(LUA_STDLIB_VERSION_UPSTREAM)-1
 LUA_STDLIB_NAME_UPSTREAM = stdlib
 LUA_STDLIB_SUBDIR = lua-stdlib-release-v$(LUA_STDLIB_VERSION_UPSTREAM)
