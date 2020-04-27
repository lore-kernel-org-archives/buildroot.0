From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 21:54:17 +0200
Subject: [Buildroot] [git commit] package/libcec: bump version to 5.0.0
Message-ID: <20200427193934.D49EC90908@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c34dbdde23655929829a1f1d668b849b9c18a5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to upstream commit:
https://github.com/Pulse-Eight/libcec/commit/d5e5200ed1a998af24fa5290ad764e0a2ed086c6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcec/libcec.hash | 4 ++--
 package/libcec/libcec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
index c457ee7097..000a4f7b40 100644
--- a/package/libcec/libcec.hash
+++ b/package/libcec/libcec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 035c617e48e14b1d70c503c5fefce42142198e36fefa0f8b01f0228df65edb52  libcec-91da1b6d5daecd3c85a1ac06d325ee4554f69b83.tar.gz
-sha256 3618005b3db4eb8ede7292d233e6c41605cb8dcbd33e8790eff6e29c1e4f3789  COPYING
+sha256  7c6ef02f39918ac88a3dac8ea35021f6c4b4b695df9204b3ac9faca673c706cc  libcec-5.0.0.tar.gz
+sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  COPYING
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index e85fd6a4d3..8c0981e488 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = 91da1b6d5daecd3c85a1ac06d325ee4554f69b83
-LIBCEC_SITE = $(call github,Pulse-Eight,libcec,$(LIBCEC_VERSION))
+LIBCEC_VERSION = 5.0.0
+LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPL-2.0+
 LIBCEC_LICENSE_FILES = COPYING
 
