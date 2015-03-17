From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 17 Mar 2015 21:04:47 +0100
Subject: [Buildroot] [PATCH 1/3] luarocks: bump to version 2.2.1
Message-ID: <1426622689-31844-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 40fdc91..12a1f08 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 2.2.0
+LUAROCKS_VERSION = 2.2.1
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.1.0
