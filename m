From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 28 Apr 2013 21:52:11 +0200
Subject: [Buildroot] [git commit] directfb-examples: bump to version 1.6.0
Message-ID: <20130428205745.C20D39B8AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4311d719fd7e2fbd117f96ccb37ea4c2b6add43d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous version 1.2.0 isn't acting well with directfb 1.6.3 so
increasing the version to the latest available version on directfb.org.

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb-examples/directfb-examples.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index 26cc499..c7235d6 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DIRECTFB_EXAMPLES_VERSION = 1.2.0
+DIRECTFB_EXAMPLES_VERSION = 1.6.0
 DIRECTFB_EXAMPLES_SITE = http://www.directfb.org/downloads/Extras
 DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
 DIRECTFB_EXAMPLES_INSTALL_STAGING = YES
