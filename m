From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 21:39:33 +0100
Subject: [Buildroot] [git commit] package/x11r7/xproto_presentproto: bump
	version to 1.1
Message-ID: <20170201204119.42B8E82037@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=972b0caafcad83e3ac90088889d2d648a28255b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xproto_presentproto/xproto_presentproto.hash | 4 ++--
 package/x11r7/xproto_presentproto/xproto_presentproto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xproto_presentproto/xproto_presentproto.hash b/package/x11r7/xproto_presentproto/xproto_presentproto.hash
index f947d91..aa45d91 100644
--- a/package/x11r7/xproto_presentproto/xproto_presentproto.hash
+++ b/package/x11r7/xproto_presentproto/xproto_presentproto.hash
@@ -1,2 +1,2 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/2078
-sha256	812c7d48721f909a0f7a2cb1e91f6eead76159a36c4712f4579ca587552839ce	presentproto-1.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002770.html
+sha256 f69b23a8869f78a5898aaf53938b829c8165e597cda34f06024d43ee1e6d26b9  presentproto-1.1.tar.bz2
diff --git a/package/x11r7/xproto_presentproto/xproto_presentproto.mk b/package/x11r7/xproto_presentproto/xproto_presentproto.mk
index 6fea0a2..0097b9c 100644
--- a/package/x11r7/xproto_presentproto/xproto_presentproto.mk
+++ b/package/x11r7/xproto_presentproto/xproto_presentproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_PRESENTPROTO_VERSION = 1.0
+XPROTO_PRESENTPROTO_VERSION = 1.1
 XPROTO_PRESENTPROTO_SOURCE = presentproto-$(XPROTO_PRESENTPROTO_VERSION).tar.bz2
 XPROTO_PRESENTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_PRESENTPROTO_LICENSE = MIT
