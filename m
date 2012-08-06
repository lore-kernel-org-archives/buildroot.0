From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  6 Aug 2012 07:46:42 +0200
Subject: [Buildroot] [PATCH 4/9] coxpcall: add license info
In-Reply-To: <1344232007-3085-1-git-send-email-francois.perrad@gadz.org>
References: <1344232007-3085-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1344232007-3085-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/coxpcall/coxpcall.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index 94fc16c..e7fb76d 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -7,6 +7,7 @@
 COXPCALL_VERSION = 1.13.0
 COXPCALL_SITE = http://luaforge.net/frs/download.php/3406
 COXPCALL_DEPENDENCIES = lua
+COXPCALL_LICENSE = MIT
 
 define COXPCALL_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/src/coxpcall.lua \
-- 
1.7.9.5
