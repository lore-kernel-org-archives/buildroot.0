From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Jan 2017 19:37:47 +0100
Subject: [Buildroot] [PATCH 13/16] package/x11r7/xproto_presentproto: bump
	version to 1.1
In-Reply-To: <20170131183750.15481-1-bernd.kuhls@t-online.de>
References: <20170131183750.15481-1-bernd.kuhls@t-online.de>
Message-ID: <20170131183750.15481-13-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xproto_presentproto/xproto_presentproto.hash | 4 ++--
 package/x11r7/xproto_presentproto/xproto_presentproto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xproto_presentproto/xproto_presentproto.hash b/package/x11r7/xproto_presentproto/xproto_presentproto.hash
index f947d915a..aa45d9167 100644
--- a/package/x11r7/xproto_presentproto/xproto_presentproto.hash
+++ b/package/x11r7/xproto_presentproto/xproto_presentproto.hash
@@ -1,2 +1,2 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/2078
-sha256	812c7d48721f909a0f7a2cb1e91f6eead76159a36c4712f4579ca587552839ce	presentproto-1.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002770.html
+sha256 f69b23a8869f78a5898aaf53938b829c8165e597cda34f06024d43ee1e6d26b9  presentproto-1.1.tar.bz2
diff --git a/package/x11r7/xproto_presentproto/xproto_presentproto.mk b/package/x11r7/xproto_presentproto/xproto_presentproto.mk
index 6fea0a2f8..0097b9cdd 100644
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
-- 
2.11.0
