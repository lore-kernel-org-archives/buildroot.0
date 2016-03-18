From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 22:52:49 +0100
Subject: [Buildroot] [git commit] libfslcodec: bump to version 4.0.8
Message-ID: <20160318223205.15F2B81D2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a972e9e462f7f3988d8cf8a4b910241c3973a0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog since 4.0.7:
- Version alignment with other Multimedia components.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/6a1f559a

This package has been implicitely tested through gstreamer as the 0.10
plugin relies on it:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfslcodec/libfslcodec.hash | 2 +-
 package/libfslcodec/libfslcodec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfslcodec/libfslcodec.hash b/package/libfslcodec/libfslcodec.hash
index d977a66..fd934f7 100644
--- a/package/libfslcodec/libfslcodec.hash
+++ b/package/libfslcodec/libfslcodec.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	de1251286ebbc1541452f2f70fbd73e42c58f95630d65d1f9aaabf10a6caa38f  libfslcodec-4.0.7.bin
+sha256	544ffc5989bce18ca50c7a826cc03370b1cf8455335e4291ef0c0779b4c33de0  libfslcodec-4.0.8.bin
diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index e151c66..502390f 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFSLCODEC_VERSION = 4.0.7
+LIBFSLCODEC_VERSION = 4.0.8
 LIBFSLCODEC_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
 LIBFSLCODEC_INSTALL_STAGING = YES
