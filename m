From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:48:28 +0200
Subject: [Buildroot] [git commit] xproto_compositeproto: version bump to
	0.4.2
Message-ID: <20120922194141.9ADC69963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b65769ce21a37660f27983aa5e559ad945fcdc9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xproto_compositeproto/xproto_compositeproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
index dc6138b..2d5f6cc 100644
--- a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
+++ b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_COMPOSITEPROTO_VERSION = 0.4.1
+XPROTO_COMPOSITEPROTO_VERSION = 0.4.2
 XPROTO_COMPOSITEPROTO_SOURCE = compositeproto-$(XPROTO_COMPOSITEPROTO_VERSION).tar.bz2
 XPROTO_COMPOSITEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_COMPOSITEPROTO_INSTALL_STAGING = YES
