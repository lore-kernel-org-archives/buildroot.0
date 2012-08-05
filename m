From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  5 Aug 2012 08:52:37 +0200
Subject: [Buildroot] [PATCH 3/9] [copas] add license info
In-Reply-To: <1344149563-20917-1-git-send-email-francois.perrad@gadz.org>
References: <1344149563-20917-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1344149563-20917-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/copas/copas.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index cd9ab7a..c84a6cc 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -7,6 +7,7 @@
 COPAS_VERSION = 1.1.6
 COPAS_SITE = http://github.com/downloads/keplerproject/copas
 COPAS_DEPENDENCIES = lua coxpcall luasocket
+COPAS_LICENSE = MIT
 
 define COPAS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/src/copas/copas.lua \
-- 
1.7.9.5
