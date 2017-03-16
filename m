From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 16 Mar 2017 15:32:01 +0100
Subject: [Buildroot] [PATCH] libsamplerate: bump to version 0.1.9
Message-ID: <20170316143201.2159-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsamplerate is relicensed under the 2 clause BSD license.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libsamplerate/libsamplerate.hash | 2 +-
 package/libsamplerate/libsamplerate.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsamplerate/libsamplerate.hash b/package/libsamplerate/libsamplerate.hash
index a495108d3..a303f0bcf 100644
--- a/package/libsamplerate/libsamplerate.hash
+++ b/package/libsamplerate/libsamplerate.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	93b54bdf46d5e6d2354b7034395fe329c222a966790de34520702bb9642f1c06	libsamplerate-0.1.8.tar.gz
+sha256  0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1  libsamplerate-0.1.9.tar.gz
diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
index 28fd644fa..802b5b14a 100644
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBSAMPLERATE_VERSION = 0.1.8
+LIBSAMPLERATE_VERSION = 0.1.9
 LIBSAMPLERATE_SITE = http://www.mega-nerd.com/SRC
 LIBSAMPLERATE_INSTALL_STAGING = YES
 LIBSAMPLERATE_DEPENDENCIES = host-pkgconf
 LIBSAMPLERATE_CONF_OPTS = --disable-fftw --program-transform-name=''
-LIBSAMPLERATE_LICENSE = Dual GPLv2+ / libsamplerate commercial use license
+LIBSAMPLERATE_LICENSE = BSD-2c
 LIBSAMPLERATE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
-- 
2.12.0
