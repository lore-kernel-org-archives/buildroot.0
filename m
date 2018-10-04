From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 14:31:35 +0200
Subject: [Buildroot] [git commit] package/libopusenc: bump to version 0.2
Message-ID: <20181004123056.D8CEF8CA0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78b3527860b1305026b3e3ac557f2c2afa0a313c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libopusenc/libopusenc.hash | 2 +-
 package/libopusenc/libopusenc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopusenc/libopusenc.hash b/package/libopusenc/libopusenc.hash
index 1eea51b6bc..122e792bf7 100644
--- a/package/libopusenc/libopusenc.hash
+++ b/package/libopusenc/libopusenc.hash
@@ -1,3 +1,3 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256  02e6e0b14cbbe0569d948a46420f9c9a81d93bba32dc576a4007cbf96da68ef3  libopusenc-0.1.1.tar.gz
+sha256  c79e95eeee43a0b965e9b2c59a243763a8f8b0a7e71441df2aa9084f6171c73a  libopusenc-0.2.tar.gz
 sha256  93b17ab56b8230127fea532be0dcb4e6d71e66ab5e8ce5d6ae8785d7288b164f  COPYING
diff --git a/package/libopusenc/libopusenc.mk b/package/libopusenc/libopusenc.mk
index 0debe85c71..16b83d0c40 100644
--- a/package/libopusenc/libopusenc.mk
+++ b/package/libopusenc/libopusenc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPUSENC_VERSION = 0.1.1
+LIBOPUSENC_VERSION = 0.2
 LIBOPUSENC_SITE = https://downloads.xiph.org/releases/opus
 LIBOPUSENC_LICENSE = BSD-3-Clause
 LIBOPUSENC_LICENSE_FILES = COPYING
