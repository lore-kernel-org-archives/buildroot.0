From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 19 Dec 2015 17:07:34 +0100
Subject: [Buildroot] [PATCH 1/1] directfb-examples: indentation cleanup
Message-ID: <1450541254-26173-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/directfb-examples/directfb-examples.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index ee883f7..1ba85df 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -12,7 +12,7 @@ DIRECTFB_EXAMPLES_LICENSE_FILES = COPYING
 DIRECTFB_EXAMPLES_DEPENDENCIES = directfb
 
 ifeq ($(BR2_STATIC_LIBS),y)
-        DIRECTFB_EXAMPLES_CONF_OPTS += LIBS=-lstdc++
+DIRECTFB_EXAMPLES_CONF_OPTS += LIBS=-lstdc++
 endif
 
 $(eval $(autotools-package))
-- 
1.9.1
