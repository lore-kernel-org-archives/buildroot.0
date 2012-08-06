From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  6 Aug 2012 07:46:39 +0200
Subject: [Buildroot] [PATCH 1/9] luajit: add license info
Message-ID: <1344232007-3085-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index b35cdb4..e4c46d8 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -7,6 +7,8 @@
 LUAJIT_VERSION = 2.0.0-beta10
 LUAJIT_SOURCE  = LuaJIT-$(LUAJIT_VERSION).tar.gz
 LUAJIT_SITE    = http://luajit.org/download
+LUAJIT_LICENSE = MIT
+LUAJIT_LICENSE_FILES = COPYRIGHT
 
 LUAJIT_INSTALL_STAGING = YES
 
-- 
1.7.9.5
