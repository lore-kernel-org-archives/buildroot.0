From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 21 Sep 2019 00:38:23 +0300
Subject: [Buildroot] [PATCH 1/4] package/libwpe: bump to version 1.4.0
In-Reply-To: <20190920213826.2531495-1-aperez@igalia.com>
References: <20190920213826.2531495-1-aperez@igalia.com>
Message-ID: <20190920213826.2531495-2-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WPE WebKit 2.26.0 requires libwpe 1.4.x, as indicated at:

  https://wpewebkit.org/release/schedule/#compatible-components

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libwpe/libwpe.hash | 8 ++++----
 package/libwpe/libwpe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index c46e205dcf..91332ca51f 100644
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
 sha256 6efc9991641b47b1f4e727db7f090d0ade00117dcbbc74be622f2baceddb1f22 COPYING
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
-- 
2.23.0
