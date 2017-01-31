From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Jan 2017 19:37:48 +0100
Subject: [Buildroot] [PATCH 14/16] package/x11r7/xapp_xconsole: bump version
	to 1.0.7
In-Reply-To: <20170131183750.15481-1-bernd.kuhls@t-online.de>
References: <20170131183750.15481-1-bernd.kuhls@t-online.de>
Message-ID: <20170131183750.15481-14-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xconsole/xapp_xconsole.hash | 4 ++--
 package/x11r7/xapp_xconsole/xapp_xconsole.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.hash b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
index a62d8cbb2..364cdbe40 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.hash
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2013-July/002272.html
-sha256	e561959b6ee8b735a32c1050015cfd8c551ed162cabb6cb72e36ce72966855d1	xconsole-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002774.html
+sha256 d1144882df207378381bc83927906559defbf7b83a01d52c50ad44234c5851e0  xconsole-1.0.7.tar.bz2
diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.mk b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
index 971b1b32e..52656de83 100644
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
-- 
2.11.0
