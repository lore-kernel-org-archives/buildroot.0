From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 15:17:13 +0200
Subject: [Buildroot] [git commit] package/libcec: downgrade to version 4.0.5
Message-ID: <20200711131350.DCAAA86303@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b77a0687eae412150719ab45bf7c608d52124d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to
https://github.com/Pulse-Eight/libcec/releases/tag/libcec-5.0.0
version 5.0.0 is "not compatible with Kodi 18.x. Please use libCEC
4.0.5 instead."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcec/libcec.hash | 2 +-
 package/libcec/libcec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
index 000a4f7b40..aa09b36bd8 100644
--- a/package/libcec/libcec.hash
+++ b/package/libcec/libcec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7c6ef02f39918ac88a3dac8ea35021f6c4b4b695df9204b3ac9faca673c706cc  libcec-5.0.0.tar.gz
+sha256  e4d749430ebcf3a35ec3a3f6675afcc5755afc1e5801c12121e54d80eb187743  libcec-4.0.5.tar.gz
 sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  COPYING
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 8c0981e488..d5f1caf7c5 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = 5.0.0
+LIBCEC_VERSION = 4.0.5
 LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPL-2.0+
 LIBCEC_LICENSE_FILES = COPYING
