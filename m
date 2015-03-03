From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  3 Mar 2015 09:41:14 +0100
Subject: [Buildroot] [PATCH 4/5] ncmpc: change tarball compression to xz
In-Reply-To: <1425372075-22985-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1425372075-22985-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1425372075-22985-4-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/ncmpc/ncmpc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 0b81faf..050b6b8 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -6,7 +6,7 @@
 
 NCMPC_VERSION_MAJOR = 0
 NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).24
-NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.gz
+NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = host-pkgconf libglib2 libmpdclient ncurses
 NCMPC_LICENSE = GPLv2+
-- 
1.9.1
