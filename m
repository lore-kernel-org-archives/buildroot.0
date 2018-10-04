From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  4 Oct 2018 06:48:23 +0200
Subject: [Buildroot] [PATCH] package/libopusenc: bump to version 0.2
Message-ID: <20181004044823.20594-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
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
-- 
2.19.0
