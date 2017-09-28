From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 28 Sep 2017 14:55:04 -0300
Subject: [Buildroot] [PATCH] qemu: drop "--disable-uuid" configuration
	parameter
Message-ID: <1506621304-21108-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

./configure: --disable-uuid is obsolete, UUID support is always built

Change-Id: I9e278418d19e15bbbd3ea233658cd62f75e3385c
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/qemu/qemu.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index f02df8b..f42d649 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -238,7 +238,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-curses \
 			--disable-curl \
 			--disable-bluez \
-			--disable-uuid \
 			--disable-vde \
 			--disable-linux-aio \
 			--disable-cap-ng \
-- 
2.7.5
