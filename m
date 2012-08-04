From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Aug 2012 13:15:13 +0200
Subject: [Buildroot] [git commit] luacjson: Add license info
Message-ID: <20120804112012.8DC4497015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=82c3a3322857c36601f795f5f8be54d9af33641b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/luacjson/luacjson.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/luacjson/luacjson.mk b/package/luacjson/luacjson.mk
index fe92f16..1f79d5d 100644
--- a/package/luacjson/luacjson.mk
+++ b/package/luacjson/luacjson.mk
@@ -3,10 +3,12 @@
 # luacjson
 #
 #############################################################
-LUACJSON_VERSION      = 2.1.0
-LUACJSON_SOURCE       = lua-cjson-$(LUACJSON_VERSION).tar.gz
-LUACJSON_SITE         = http://www.kyne.com.au/~mark/software/download
-LUACJSON_DEPENDENCIES = lua
+LUACJSON_VERSION       = 2.1.0
+LUACJSON_SOURCE        = lua-cjson-$(LUACJSON_VERSION).tar.gz
+LUACJSON_SITE          = http://www.kyne.com.au/~mark/software/download
+LUACJSON_DEPENDENCIES  = lua
+LUACJSON_LICENSE       = MIT
+LUACJSON_LICENSE_FILES = LICENSE
 
 define LUACJSON_BUILD_CMDS
 	$(MAKE) -C $(@D) \
