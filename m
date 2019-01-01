From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jan 2019 21:09:31 +0100
Subject: [Buildroot] [git commit] package/libopusenc: bump to version 0.2.1
Message-ID: <20190101200759.1D5028843A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6f00d85448db1dacf6ce10873661fe312278f99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release fixes two minor bugs:

- a gapless bug in the LPC filtering
- a crash on destroy when using the pull API

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopusenc/libopusenc.hash | 2 +-
 package/libopusenc/libopusenc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopusenc/libopusenc.hash b/package/libopusenc/libopusenc.hash
index 122e792bf7..bdb4cf8fde 100644
--- a/package/libopusenc/libopusenc.hash
+++ b/package/libopusenc/libopusenc.hash
@@ -1,3 +1,3 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256  c79e95eeee43a0b965e9b2c59a243763a8f8b0a7e71441df2aa9084f6171c73a  libopusenc-0.2.tar.gz
+sha256  8298db61a8d3d63e41c1a80705baa8ce9ff3f50452ea7ec1c19a564fe106cbb9  libopusenc-0.2.1.tar.gz
 sha256  93b17ab56b8230127fea532be0dcb4e6d71e66ab5e8ce5d6ae8785d7288b164f  COPYING
diff --git a/package/libopusenc/libopusenc.mk b/package/libopusenc/libopusenc.mk
index 16b83d0c40..3b4dc0e714 100644
--- a/package/libopusenc/libopusenc.mk
+++ b/package/libopusenc/libopusenc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPUSENC_VERSION = 0.2
+LIBOPUSENC_VERSION = 0.2.1
 LIBOPUSENC_SITE = https://downloads.xiph.org/releases/opus
 LIBOPUSENC_LICENSE = BSD-3-Clause
 LIBOPUSENC_LICENSE_FILES = COPYING
