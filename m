From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Mar 2017 19:13:54 +0100
Subject: [Buildroot] [PATCH] package/memtool: fix trailing /
Message-ID: <1488564834-27671-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/memtool/memtool.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/memtool/memtool.mk b/package/memtool/memtool.mk
index 59b864c..f641627 100644
--- a/package/memtool/memtool.mk
+++ b/package/memtool/memtool.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MEMTOOL_VERSION = 2016.10.0
-MEMTOOL_SITE = http://public.pengutronix.de/software/memtool/
+MEMTOOL_SITE = http://public.pengutronix.de/software/memtool
 MEMTOOL_SOURCE = memtool-$(MEMTOOL_VERSION).tar.xz
 MEMTOOL_LICENSE = GPLv2
 MEMTOOL_LICENSE_FILES = COPYING
-- 
2.7.4
