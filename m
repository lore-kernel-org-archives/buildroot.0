From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 27 Oct 2012 23:25:30 +0200
Subject: [Buildroot] [git commit] directfb bump version 1.4.17
Message-ID: <20121027213137.645069991A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ae8b1262f209c3e1ede42bfdfd0c51d64be06b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version to 1.4.17  (buxfix release)

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/directfb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index e5763d7..b1e35ae 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 DIRECTFB_VERSION_MAJOR = 1.4
-DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).16
+DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).17
 DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_LICENSE = LGPLv2.1+
