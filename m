From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:45:36 +0200
Subject: [Buildroot] [git commit] xproto_printproto: version bump to 1.0.5
Message-ID: <20120922194138.23FC6995DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f97e6ffb99beaa176559cb09472212ec74369e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../x11r7/xproto_printproto/xproto_printproto.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_printproto/xproto_printproto.mk b/package/x11r7/xproto_printproto/xproto_printproto.mk
index c67e4fa..641553f 100644
--- a/package/x11r7/xproto_printproto/xproto_printproto.mk
+++ b/package/x11r7/xproto_printproto/xproto_printproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_PRINTPROTO_VERSION = 1.0.3
+XPROTO_PRINTPROTO_VERSION = 1.0.5
 XPROTO_PRINTPROTO_SOURCE = printproto-$(XPROTO_PRINTPROTO_VERSION).tar.bz2
 XPROTO_PRINTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_PRINTPROTO_INSTALL_STAGING = YES
