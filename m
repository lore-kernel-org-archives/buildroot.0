From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 16:42:39 +0200
Subject: [Buildroot] [git commit] package/x11r7/xproto_xproto: bump version
	to 7.0.29
Message-ID: <20160611144302.B5FC081D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7050a0e927a8f81772ddb43b373e1ee02a4d7066
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xproto_xproto/xproto_xproto.hash | 4 ++--
 package/x11r7/xproto_xproto/xproto_xproto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xproto_xproto/xproto_xproto.hash b/package/x11r7/xproto_xproto/xproto_xproto.hash
index 333ac6d..8441bae 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.hash
+++ b/package/x11r7/xproto_xproto/xproto_xproto.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-July/002618.html
-sha256	29e85568d1f68ceef8a2c081dad9bc0e5500a53cfffde24b564dc43d46ddf6ca	xproto-7.0.28.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-May/002692.html
+sha256	6c1a477092ca73233902b8d5f33012635c4b0208f17e7833cc7efe5c93ba9f8a	xproto-7.0.29.tar.bz2
diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
index 7357b8c..e76adf8 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ b/package/x11r7/xproto_xproto/xproto_xproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XPROTO_VERSION = 7.0.28
+XPROTO_XPROTO_VERSION = 7.0.29
 XPROTO_XPROTO_SOURCE = xproto-$(XPROTO_XPROTO_VERSION).tar.bz2
 XPROTO_XPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XPROTO_LICENSE = MIT
