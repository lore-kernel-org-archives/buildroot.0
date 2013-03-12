From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 12 Mar 2013 14:24:25 +0100
Subject: [Buildroot] [PATCH] eeprog.mk: fix site
Message-ID: <1363094665-32176-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/eeprog/eeprog.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eeprog/eeprog.mk b/package/eeprog/eeprog.mk
index e64fa06..3b1b3e9 100644
--- a/package/eeprog/eeprog.mk
+++ b/package/eeprog/eeprog.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 EEPROG_VERSION = 0.7.6
-EEPROG_SITE = http://codesink.org/download
+EEPROG_SITE = http://www.codesink.org/download
 
 define EEPROG_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-- 
1.7.9.5
