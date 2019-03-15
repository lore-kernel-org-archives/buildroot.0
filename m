From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Mar 2019 19:02:31 +0100
Subject: [Buildroot] [PATCH 05/31] package/x11r7/xapp_xditview: bump version
 to 1.0.5
In-Reply-To: <20190315180256.20256-1-bernd.kuhls@t-online.de>
References: <20190315180256.20256-1-bernd.kuhls@t-online.de>
Message-ID: <20190315180256.20256-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xditview/xapp_xditview.hash | 7 ++++++-
 package/x11r7/xapp_xditview/xapp_xditview.mk   | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xditview/xapp_xditview.hash b/package/x11r7/xapp_xditview/xapp_xditview.hash
index c8c1a0cb56..0eb3a13ff7 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.hash
+++ b/package/x11r7/xapp_xditview/xapp_xditview.hash
@@ -1,2 +1,7 @@
 # From http://lists.x.org/archives/xorg-announce/2015-April/002570.html
-sha256	307f8df1bc3e90a7fba74dfe16840891c365abc027fbd556027eb057e5d1ff73	xditview-1.0.4.tar.bz2
+md5 3a909116a3b2abe3845215cf49e09fa5  xditview-1.0.5.tar.bz2
+sha1 f06f65bca31168c86bcebd7f92dbbda08817a5cc  xditview-1.0.5.tar.bz2
+sha256 eecb1ed51ab4edc7f454476d1248cfb7799a17c5679b3dd834e8b4658331c04b  xditview-1.0.5.tar.bz2
+sha512 e20c903f38394b496111267e142d84d11e69a3b89f91869652d1f2ee5c997a13f90bfa2966651b42cd3979a330b348a6e397cc6a74c45b1f3f91643e7c06765d  xditview-1.0.5.tar.bz2
+# Locally computed
+sha256 023d879308a49249181f78bbb567e93c45138ad847fe969d191e4802e7a1a005  COPYING
diff --git a/package/x11r7/xapp_xditview/xapp_xditview.mk b/package/x11r7/xapp_xditview/xapp_xditview.mk
index e8d72770ea..388710034c 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.mk
+++ b/package/x11r7/xapp_xditview/xapp_xditview.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDITVIEW_VERSION = 1.0.4
+XAPP_XDITVIEW_VERSION = 1.0.5
 XAPP_XDITVIEW_SOURCE = xditview-$(XAPP_XDITVIEW_VERSION).tar.bz2
 XAPP_XDITVIEW_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDITVIEW_LICENSE = MIT
-- 
2.20.1
