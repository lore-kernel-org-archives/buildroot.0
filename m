From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu,  2 Aug 2012 22:53:50 -0400
Subject: [Buildroot] [PATCH 4/6] luacjson: Add license info
In-Reply-To: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
References: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1343962432-2772-4-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/luacjson/luacjson.mk |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

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
-- 
1.7.9.5
