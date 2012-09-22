From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:44:29 +0200
Subject: [Buildroot] [git commit] xproto_resourceproto: version bump to 1.1.1
Message-ID: <20120922194136.E4AA6995DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b90c774c071ff7c9dc4ca6c195a4c66df444a1a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xproto_resourceproto/xproto_resourceproto.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
index df63e2e..7f8121d 100644
--- a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
+++ b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_RESOURCEPROTO_VERSION = 1.1.0
+XPROTO_RESOURCEPROTO_VERSION = 1.1.1
 XPROTO_RESOURCEPROTO_SOURCE = resourceproto-$(XPROTO_RESOURCEPROTO_VERSION).tar.bz2
 XPROTO_RESOURCEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RESOURCEPROTO_INSTALL_STAGING = YES
