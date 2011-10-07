From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 7 Oct 2011 13:29:38 +0200
Subject: [Buildroot] [git commit] sawman: bump to version 1.4.15
Message-ID: <20111007113307.52ECB8E289@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9db9779a3f240b10bb4f1a3e649f1829b6f35c6b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sawman/sawman.mk |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index 71d52ae..504cc9e 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -3,11 +3,10 @@
 # SAWMAN
 #
 #############################################################
-SAWMAN_VERSION:=1.4.11
-SAWMAN_SOURCE:=SaWMan-$(SAWMAN_VERSION).tar.gz
-SAWMAN_SITE:=http://www.directfb.org/downloads/Extras
+SAWMAN_VERSION = 1.4.15
+SAWMAN_SOURCE = SaWMan-$(SAWMAN_VERSION).tar.gz
+SAWMAN_SITE = http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
 SAWMAN_DEPENDENCIES = directfb
 
 $(eval $(call AUTOTARGETS))
-
