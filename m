From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 19 Dec 2014 00:02:20 +0100
Subject: [Buildroot] [PATCH 1/1] ympd: fix license typo
Message-ID: <1418943740-28989-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/ympd/ympd.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ympd/ympd.mk b/package/ympd/ympd.mk
index 2898c9d..346c510 100644
--- a/package/ympd/ympd.mk
+++ b/package/ympd/ympd.mk
@@ -7,7 +7,7 @@
 YMPD_VERSION = a98d760dddff4b0dd595d977c9077f34beff05c5
 YMPD_SITE = $(call github,notandy,ympd,$(YMPD_VERSION))
 YMPD_LICENSE = GPLv2
-YMPD_LICENSE_FILE = LICENSE
+YMPD_LICENSE_FILES = LICENSE
 YMPD_DEPENDENCIES = libmpdclient
 
 define YMPD_MAKE_HOST_TOOL
-- 
1.7.9.5
