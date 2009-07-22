From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Wed, 22 Jul 2009 10:55:04 +0200
Subject: [Buildroot] [PATCH] Bump SaWMan to 1.4.1
Message-ID: <1248252904.27682.15.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump SaWMan to 1.4.1

The current version of sawman (1.2.0-rc1) won't compile with directFB >= 1.4

Signed-off-by: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
---
 package/sawman/sawman.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index 1e525ac..76e599a 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -3,7 +3,7 @@
 # SAWMAN
 #
 #############################################################
-SAWMAN_VERSION:=1.2.0-rc1
+SAWMAN_VERSION:=1.4.1
 SAWMAN_SOURCE:=SaWMan-$(SAWMAN_VERSION).tar.gz
 SAWMAN_SITE:=http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
-- 
1.6.3.3
