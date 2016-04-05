From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Apr 2016 21:32:32 +0200
Subject: [Buildroot] [git commit] package/x11r7/xproto_inputproto: bump
	version to 2.3.2
Message-ID: <20160405194001.BEC648024D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c55cf92de258e6b7e52043e2de8f121285a6f71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xproto_inputproto/xproto_inputproto.hash | 4 ++--
 package/x11r7/xproto_inputproto/xproto_inputproto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.hash b/package/x11r7/xproto_inputproto/xproto_inputproto.hash
index 426e66f..4ecdddc 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.hash
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.hash
@@ -1,2 +1,2 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/2167
-sha256	5a47ee62053a6acef3a83f506312494be1461068d0b9269d818839703b95c1d1	inputproto-2.3.1.tar.bz2
+# From https://lists.freedesktop.org/archives/xorg-announce/2016-April/002682.html
+sha256	893a6af55733262058a27b38eeb1edc733669f01d404e8581b167f03c03ef31d	inputproto-2.3.2.tar.bz2
diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
index a3a6065..20169b5 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_INPUTPROTO_VERSION = 2.3.1
+XPROTO_INPUTPROTO_VERSION = 2.3.2
 XPROTO_INPUTPROTO_SOURCE = inputproto-$(XPROTO_INPUTPROTO_VERSION).tar.bz2
 XPROTO_INPUTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_INPUTPROTO_LICENSE = MIT
