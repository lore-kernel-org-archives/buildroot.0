From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu,  2 Aug 2012 22:53:49 -0400
Subject: [Buildroot] [PATCH 3/6] lua: Add license info
In-Reply-To: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
References: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1343962432-2772-3-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/lua/lua.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 26c1576..de60c57 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -7,6 +7,8 @@
 LUA_VERSION = 5.1.5
 LUA_SITE = http://www.lua.org/ftp
 LUA_INSTALL_STAGING = YES
+LUA_LICENSE = MIT
+LUA_LICENSE_FILES = COPYRIGHT
 
 LUA_CFLAGS = -Wall
 ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
-- 
1.7.9.5
