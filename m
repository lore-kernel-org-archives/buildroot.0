From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 23:13:00 +0200
Subject: [Buildroot] [git commit] package/x11r7/xproto_xproto: bump version
	to 7.0.31
Message-ID: <20160925211322.62BC380125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e302064dd4cc29b783adb3b6354ea606a4c52716
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xproto_xproto/xproto_xproto.hash | 4 ++--
 package/x11r7/xproto_xproto/xproto_xproto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xproto_xproto/xproto_xproto.hash b/package/x11r7/xproto_xproto/xproto_xproto.hash
index 8441bae..4b77d25 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.hash
+++ b/package/x11r7/xproto_xproto/xproto_xproto.hash
@@ -1,2 +1,2 @@
-# From https://lists.x.org/archives/xorg-announce/2016-May/002692.html
-sha256	6c1a477092ca73233902b8d5f33012635c4b0208f17e7833cc7efe5c93ba9f8a	xproto-7.0.29.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-September/002713.html
+sha256 c6f9747da0bd3a95f86b17fb8dd5e717c8f3ab7f0ece3ba1b247899ec1ef7747  xproto-7.0.31.tar.bz2
diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
index e76adf8..76f9d32 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ b/package/x11r7/xproto_xproto/xproto_xproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XPROTO_VERSION = 7.0.29
+XPROTO_XPROTO_VERSION = 7.0.31
 XPROTO_XPROTO_SOURCE = xproto-$(XPROTO_XPROTO_VERSION).tar.bz2
 XPROTO_XPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XPROTO_LICENSE = MIT
