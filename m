From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 13 Jul 2020 18:08:20 +0200
Subject: [Buildroot] [PATCH 2/2] package/gupnp: security bump to version
 1.2.3
In-Reply-To: <20200713160820.1342225-1-fontaine.fabrice@gmail.com>
References: <20200713160820.1342225-1-fontaine.fabrice@gmail.com>
Message-ID: <20200713160820.1342225-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It includes the following commits:
https://github.com/GNOME/gupnp/commit/66a73e96f5a733a149803a985686a4e4e196f90b
https://github.com/GNOME/gupnp/commit/f943904e2d7f21601337b90058faf74b49c02796
which mitigate CVE-2020-12695

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp/gupnp.hash | 4 ++--
 package/gupnp/gupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index 24a0d36631..6baf105318 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.2/gupnp-1.2.2.sha256sum:
-sha256  9a80bd953e5c8772ad26b72f8da01cbe7241a113edd6084903f413ce751c9989  gupnp-1.2.2.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.2/gupnp-1.2.3.sha256sum:
+sha256  d447e54d88e4a8fab84ad1766070e9208e21166fc7e2ce95df6e33e49e8d29b1  gupnp-1.2.3.tar.xz
 
 # Hash for license file:
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index dfe25e16c5..953beb2559 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_VERSION_MAJOR = 1.2
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).2
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).3
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPL-2.0+
-- 
2.27.0
