From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  6 Aug 2012 07:46:44 +0200
Subject: [Buildroot] [PATCH 6/9] luasocket: add license info
In-Reply-To: <1344232007-3085-1-git-send-email-francois.perrad@gadz.org>
References: <1344232007-3085-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1344232007-3085-6-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luasocket/luasocket.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index 755b61a..45fb9a3 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -7,6 +7,8 @@
 LUASOCKET_VERSION = 2.0.2
 LUASOCKET_SITE = http://luaforge.net/frs/download.php/2664
 LUASOCKET_DEPENDENCIES = lua
+LUASOCKET_LICENSE = MIT
+LUASOCKET_LICENSE_FILES = LICENSE
 
 define LUASOCKET_BUILD_CMDS
 	$(MAKE) -C $(@D) -f makefile \
-- 
1.7.9.5
