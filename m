From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2015 14:56:48 +0200
Subject: [Buildroot] [PATCH] package/freerdp: bump version
Message-ID: <1428152208-1304-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Little bump to get small bug fixes.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/freerdp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index f73bdd7..c7c933e 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Changeset on the stable-1.1 branch
-FREERDP_VERSION = b21ff842ef3de5837513042dc30488b12bd9cf9d
+FREERDP_VERSION = 770c67d340d5f0a7b48d53a1ae0fc23aff748fc4
 FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
 FREERDP_DEPENDENCIES = openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
1.9.1
