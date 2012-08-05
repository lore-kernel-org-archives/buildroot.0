From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  5 Aug 2012 08:52:42 +0200
Subject: [Buildroot] [PATCH 8/9] [wsapi] add license info
In-Reply-To: <1344149563-20917-1-git-send-email-francois.perrad@gadz.org>
References: <1344149563-20917-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1344149563-20917-8-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/wsapi/wsapi.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index f5423f3..eb2b51c 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -7,6 +7,7 @@
 WSAPI_VERSION = 1.5
 WSAPI_SITE = http://github.com/downloads/keplerproject/wsapi
 WSAPI_DEPENDENCIES = coxpcall luafilesystem rings
+WSAPI_LICENSE = MIT
 
 define WSAPI_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/share/lua/wsapi
-- 
1.7.9.5
