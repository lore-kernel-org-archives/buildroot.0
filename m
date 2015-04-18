From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:24:33 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_twm: bump version to
	1.0.9, add hash
Message-ID: <20150418162757.289BD7F8C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2238b6fbb370aa05dfe2a0f3ae099f6cc5db0630
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_twm/xapp_twm.hash |    2 ++
 package/x11r7/xapp_twm/xapp_twm.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_twm/xapp_twm.hash b/package/x11r7/xapp_twm/xapp_twm.hash
new file mode 100644
index 0000000..eecc5c4
--- /dev/null
+++ b/package/x11r7/xapp_twm/xapp_twm.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002565.html
+sha256	c575167ac33edf3bd1592f1bedfe0559debb128ed5fb4873c1278e3be166310a	twm-1.0.9.tar.bz2
diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index 7f6ba4f..1f576e1 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_TWM_VERSION = 1.0.8
+XAPP_TWM_VERSION = 1.0.9
 XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.bz2
 XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_TWM_LICENSE = MIT
