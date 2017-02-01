From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 21:39:34 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xconsole: bump version
	to 1.0.7
Message-ID: <20170201204119.54C5382131@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00be19bcbfbd0a2202346453b114dc159943fec4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xconsole/xapp_xconsole.hash | 4 ++--
 package/x11r7/xapp_xconsole/xapp_xconsole.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.hash b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
index a62d8cb..364cdbe 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.hash
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2013-July/002272.html
-sha256	e561959b6ee8b735a32c1050015cfd8c551ed162cabb6cb72e36ce72966855d1	xconsole-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002774.html
+sha256 d1144882df207378381bc83927906559defbf7b83a01d52c50ad44234c5851e0  xconsole-1.0.7.tar.bz2
diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.mk b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
index 971b1b3..52656de 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.mk
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCONSOLE_VERSION = 1.0.6
+XAPP_XCONSOLE_VERSION = 1.0.7
 XAPP_XCONSOLE_SOURCE = xconsole-$(XAPP_XCONSOLE_VERSION).tar.bz2
 XAPP_XCONSOLE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCONSOLE_LICENSE = MIT
