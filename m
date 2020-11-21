From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Nov 2020 12:21:28 +0100
Subject: [Buildroot] [PATCH/next 3/6] package/x11r7/xapp_xprop: bump version
 to 1.2.5
In-Reply-To: <20201121112131.756930-1-bernd.kuhls@t-online.de>
References: <20201121112131.756930-1-bernd.kuhls@t-online.de>
Message-ID: <20201121112131.756930-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xprop/xapp_xprop.hash | 10 ++++------
 package/x11r7/xapp_xprop/xapp_xprop.mk   |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xprop/xapp_xprop.hash b/package/x11r7/xapp_xprop/xapp_xprop.hash
index f513e12c24..43eed80ba4 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.hash
+++ b/package/x11r7/xapp_xprop/xapp_xprop.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002969.html
-md5 cc369c28383a5d7144e7197ee7d30bfa  xprop-1.2.4.tar.bz2
-sha1 0549a927d01930218f1d0089d0157eb9538b34a5  xprop-1.2.4.tar.bz2
-sha256 8c77fb096e46c60032b7e2bde9492c3ffcc18734f50b395085a5f10bfd3cf753  xprop-1.2.4.tar.bz2
-sha512 6e770cb89ba87ae057858cc9f0f5498979e78c3ef66ce86361b7c646cc0b70c41a18d76e55ed7225fe715b22b62bc07c56272519a2631b92832e9403ce260da7  xprop-1.2.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-November/003064.html
+sha256  9b92ed0316bf2486121d8bac88bd1878f16b43bd335f18009b1f941f1eca93a1  xprop-1.2.5.tar.bz2
+sha512  93cfa621fa76ca6e8e780a252c508380b6dc9db39b67bfca16bb9800f0d39110f5d18189409a8577ef79e98bf5eece17f5e23f2218ca72ae8bb04ee7b429d559  xprop-1.2.5.tar.bz2
 # Locally computed
-sha256 f19ff982936cca133b9593a6561c3817512207e0b4c951d0e4eb5956d30d4415 COPYING
+sha256  f19ff982936cca133b9593a6561c3817512207e0b4c951d0e4eb5956d30d4415 COPYING
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
index a0ad4302cb..75f0d37cdc 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ b/package/x11r7/xapp_xprop/xapp_xprop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XPROP_VERSION = 1.2.4
+XAPP_XPROP_VERSION = 1.2.5
 XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.bz2
 XAPP_XPROP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPROP_LICENSE = MIT
-- 
2.27.0
