From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Apr 2012 14:48:35 +0200
Subject: [Buildroot] [git commit] sawman: bump version
Message-ID: <20120405124913.0636396A13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc28297ce49f7749f6eab268010d3efe473a1353
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Old version was not compatible with dfb 1.4.16.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sawman/sawman.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index 504cc9e..03bec89 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -3,7 +3,7 @@
 # SAWMAN
 #
 #############################################################
-SAWMAN_VERSION = 1.4.15
+SAWMAN_VERSION = 1.4.16
 SAWMAN_SOURCE = SaWMan-$(SAWMAN_VERSION).tar.gz
 SAWMAN_SITE = http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
