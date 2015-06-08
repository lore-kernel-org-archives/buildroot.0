From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon,  8 Jun 2015 23:46:05 +0200
Subject: [Buildroot] [PATCH 1/3] mc: change tarball compression to xz
Message-ID: <1433799967-7694-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/mc/mc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index f96d396..742b8e8 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MC_VERSION = 4.8.14
-MC_SOURCE = mc-$(MC_VERSION).tar.bz2
+MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE =  GPLv3+
 MC_LICENSE_FILES = COPYING
-- 
1.9.1
