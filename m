From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 19:04:56 +0100
Subject: [Buildroot] [git commit] janus-gateway: indentation cleanup
Message-ID: <20151229180550.BA096826ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2dc5b61cab8a99ea09c95ca98db5de1ec59fcfc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
