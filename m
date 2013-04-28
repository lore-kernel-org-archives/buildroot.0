From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 28 Apr 2013 21:44:24 +0200
Subject: [Buildroot] [git commit] directfb: bumping version to 1.6.3
Message-ID: <20130428205743.B25909B895@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=861121b4f44d596569dd0c434c4d7aac6f8815e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/directfb.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 4f05ed2..8c701db 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -3,8 +3,8 @@
 # directfb
 #
 #############################################################
-DIRECTFB_VERSION_MAJOR = 1.4
-DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).17
+DIRECTFB_VERSION_MAJOR = 1.6
+DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).3
 DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_LICENSE = LGPLv2.1+
