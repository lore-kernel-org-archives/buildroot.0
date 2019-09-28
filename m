From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 23:26:05 +0200
Subject: [Buildroot] [git commit] package/libwpe: bump to version 1.4.0
Message-ID: <20190928212515.72DC582790@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7be171898f87e2e9e025918198dfa5bffe4d1ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

WPE WebKit 2.26.0 requires libwpe 1.4.x, as indicated at:

  https://wpewebkit.org/release/schedule/#compatible-components

The hash of the license file has changed, due to the following change
in COPYING:

-Copyright (C) 2015, 2016 Igalia S.L.
+Copyright (C) 2015, 2016 Igalia S.L., Metrological

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libwpe/libwpe.hash | 10 +++++-----
 package/libwpe/libwpe.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index c46e205dcf..981d44b46b 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.2.1.tar.xz.sums
-md5 9f26865f06ecf933ddbbf067a7be735f libwpe-1.2.1.tar.xz
-sha1 d3f6211a2acafe1bd1f41e826c8efae35335fc92 libwpe-1.2.1.tar.xz
-sha256 00e103c6fa226b0d979c29d14c9e8168c4bec7b0b5108f3705a037cda5609d7d libwpe-1.2.1.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.4.0.tar.xz.sums
+md5 4b6dbaa2d40408975fe1be935367b4e8 libwpe-1.4.0.tar.xz
+sha1 18825932749edecd92a3bd31d4feffb5fd1150b4 libwpe-1.4.0.tar.xz
+sha256 e2d3494fc33fe946ad917fd6a3abd127462b91bba62ef8b35507e92f8ede4188 libwpe-1.4.0.tar.xz
 
 # Hashes for license files:
-sha256 6efc9991641b47b1f4e727db7f090d0ade00117dcbbc74be622f2baceddb1f22 COPYING
+sha256 35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index 171bd75551..aec8802b2f 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWPE_VERSION = 1.2.1
+LIBWPE_VERSION = 1.4.0
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
