From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 21:39:35 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xauth: bump version to
	1.0.10
Message-ID: <20170201204119.538B78184E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7baa85d2ab73bfd59f7138386cb4e4ff37c0947
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xauth/xapp_xauth.hash | 4 ++--
 package/x11r7/xapp_xauth/xapp_xauth.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xauth/xapp_xauth.hash b/package/x11r7/xapp_xauth/xapp_xauth.hash
index 922cecf..f6987c1 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.hash
+++ b/package/x11r7/xapp_xauth/xapp_xauth.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2014-April/002414.html
-sha256	56ce1523eb48b1f8a4f4244fe1c3d8e6af1a3b7d4b0e6063582421b0b68dc28f	xauth-1.0.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002772.html
+sha256 5afe42ce3cdf4f60520d1658d2b17face45c74050f39af45dccdc95e73fafc4d  xauth-1.0.10.tar.bz2
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index a2307f2..80ac6a4 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XAUTH_VERSION = 1.0.9
+XAPP_XAUTH_VERSION = 1.0.10
 XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.bz2
 XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XAUTH_LICENSE = MIT
