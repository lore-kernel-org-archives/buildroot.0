From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 29 Dec 2015 18:10:32 +0100
Subject: [Buildroot] [PATCH 1/3] janus-gateway: indentation cleanup
Message-ID: <1451409034-17537-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/janus-gateway/janus-gateway.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index d2556e0..e1361d3 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -18,7 +18,7 @@ JANUS_GATEWAY_DEPENDENCIES = host-pkgconf libmicrohttpd jansson \
 JANUS_GATEWAY_AUTORECONF = YES
 
 define JANUS_GATEWAY_M4
-        mkdir -p $(@D)/m4
+	mkdir -p $(@D)/m4
 endef
 JANUS_GATEWAY_POST_PATCH_HOOKS += JANUS_GATEWAY_M4
 
-- 
1.9.1
