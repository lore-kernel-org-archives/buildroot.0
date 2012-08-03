From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu,  2 Aug 2012 22:53:51 -0400
Subject: [Buildroot] [PATCH 5/6] luaexpat: Add license info
In-Reply-To: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
References: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1343962432-2772-5-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/luaexpat/luaexpat.mk |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index 400d7b4..c875caa 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-LUAEXPAT_VERSION      = 1.2.0
-LUAEXPAT_SITE         = http://matthewwild.co.uk/projects/luaexpat
-LUAEXPAT_DEPENDENCIES = lua expat
+LUAEXPAT_VERSION       = 1.2.0
+LUAEXPAT_SITE          = http://matthewwild.co.uk/projects/luaexpat
+LUAEXPAT_DEPENDENCIES  = lua expat
+LUAEXPAT_LICENSE       = MIT
+LUAEXPAT_LICENSE_FILES = doc/us/license.html
 
 
 LUAEXPAT_MFLAGS += LUA_VERSION_NUM=501
-- 
1.7.9.5
