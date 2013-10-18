From: Axel Lin <axel.lin@ingics.com>
Date: Fri, 18 Oct 2013 23:44:19 +0800
Subject: [Buildroot] [PATCH v2 1/2] spice-protocol: bump to version 0.12.6
Message-ID: <1382111059.30247.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
v2: no change, just make version number consistent in this patch serial.
 package/spice-protocol/spice-protocol.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/spice-protocol/spice-protocol.mk b/package/spice-protocol/spice-protocol.mk
index 62a028d..fda87b6 100644
--- a/package/spice-protocol/spice-protocol.mk
+++ b/package/spice-protocol/spice-protocol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPICE_PROTOCOL_VERSION         = 0.12.2
+SPICE_PROTOCOL_VERSION         = 0.12.6
 SPICE_PROTOCOL_SOURCE          = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.bz2
 SPICE_PROTOCOL_SITE            = http://www.spice-space.org/download/releases/
 SPICE_PROTOCOL_LICENSE         = BSD-3c
-- 
1.8.1.2
