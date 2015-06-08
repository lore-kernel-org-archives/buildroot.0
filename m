From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon,  8 Jun 2015 23:46:07 +0200
Subject: [Buildroot] [PATCH 3/3] mc: remove extra white space
In-Reply-To: <1433799967-7694-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1433799967-7694-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1433799967-7694-3-git-send-email-jerzy.grzegorek@trzebnica.net>
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
index 742b8e8..2803c90 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -7,7 +7,7 @@
 MC_VERSION = 4.8.14
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
-MC_LICENSE =  GPLv3+
+MC_LICENSE = GPLv3+
 MC_LICENSE_FILES = COPYING
 MC_DEPENDENCIES = libglib2 host-pkgconf
 
-- 
1.9.1
