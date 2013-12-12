From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 12 Dec 2013 11:10:22 +0800
Subject: [Buildroot] [RESEND][PATCH v2 1/2] spice-protocol: bump to version
	0.12.6
Message-ID: <1386817822.23825.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
v2: no change, just make version number consistent in this patch serial.
This is a resend, it was post on http://lists.busybox.net/pipermail/buildroot/2013-October/080805.html
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
