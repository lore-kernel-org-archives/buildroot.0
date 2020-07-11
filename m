From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Jul 2020 20:00:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcec: bump version to 4.0.7
Message-ID: <20200711180029.4453-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcec/libcec.hash | 2 +-
 package/libcec/libcec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
index aa09b36bd8..36b6bad861 100644
--- a/package/libcec/libcec.hash
+++ b/package/libcec/libcec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e4d749430ebcf3a35ec3a3f6675afcc5755afc1e5801c12121e54d80eb187743  libcec-4.0.5.tar.gz
+sha256  bcd92c376993a5721d346edcc09eb17289451f9156b1d1d113c9663c2046315a  libcec-4.0.7.tar.gz
 sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  COPYING
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index d5f1caf7c5..7c37d05c7f 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = 4.0.5
+LIBCEC_VERSION = 4.0.7
 LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPL-2.0+
 LIBCEC_LICENSE_FILES = COPYING
-- 
2.26.2
