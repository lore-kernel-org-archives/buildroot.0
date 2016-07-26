From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 21:31:21 +0200
Subject: [Buildroot] [git commit] gupnp: bump to version 0.20.18
Message-ID: <20160726193210.1EBAB82119@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59221b24ec07ce926117ab794972bf45e22af057
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gupnp/gupnp.hash | 4 ++--
 package/gupnp/gupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index 4208ecd..e0082ac 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,2 +1,2 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/0.20/gupnp-0.20.16.sha256sum:
-sha256	ff1119eff12529c46837e03c742f69dc4fae48d59097d79582d38a383b832602	gupnp-0.20.16.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/0.20/gupnp-0.20.18.sha256sum:
+sha256	c5e0e11061f8d0ff9c8dccc196f39c45a49c0153c9a72abf6290ab34d1cbb021	gupnp-0.20.18.tar.xz
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index c3ec0a0..f7c32b5 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_VERSION_MAJOR = 0.20
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).16
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).18
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPLv2+
