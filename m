From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Jul 2014 17:10:32 -0300
Subject: [Buildroot] [PATCH] ncmpc: bump to version 0.23
Message-ID: <1405023032-26585-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ncmpc/ncmpc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 21ac0ae..c006af2 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).21
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).23
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.gz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = host-pkgconf libglib2 libmpdclient ncurses
-- 
1.8.5.5
