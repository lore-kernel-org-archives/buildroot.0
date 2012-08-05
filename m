From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  5 Aug 2012 08:52:43 +0200
Subject: [Buildroot] [PATCH 9/9] [xavante] add license info
In-Reply-To: <1344149563-20917-1-git-send-email-francois.perrad@gadz.org>
References: <1344149563-20917-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1344149563-20917-9-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/xavante/xavante.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index f885fbd..0c1c6f1 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -7,6 +7,7 @@
 XAVANTE_VERSION = 2.2.1
 XAVANTE_SITE = http://github.com/downloads/keplerproject/xavante
 XAVANTE_DEPENDENCIES = cgilua copas coxpcall lua luafilesystem luasocket wsapi
+XAVANTE_LICENSE = MIT
 
 define XAVANTE_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PREFIX=/usr \
-- 
1.7.9.5
