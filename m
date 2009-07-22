From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Jul 2009 14:06:16 +0200
Subject: [Buildroot] [git commit] Bump SaWMan to 1.4.1
Message-ID: <20090722120635.94A65777C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0fec1b5ce38d99851ab811bf9a8fa5efa7ff0244
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump SaWMan to 1.4.1

The current version of sawman (1.2.0-rc1) won't compile with directFB >= 1.4

Signed-off-by: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
