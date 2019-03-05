From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 05 Mar 2019 10:00:15 -0000
Subject: [Buildroot] [git commit] package/edid-decode: bump version to
 6def7bc
Message-ID: <20190305095735.C408A8E504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5e09f3899cba0853afef2f3312c61676f2cbdaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes since f56f329:

  0a454bc makefile: also honor LDFLAGS
  9e59ba9 edid-decode: update links, add README
  7684918 edid-decode: README: updates
  bc1e846 edid-decode: reformat to linux kernel coding style
  9cb3744 edid-decode: fix spurious warning about string termination
  3b26b8a edid-decode: fix wrong sample rate unit
  4437dd9 edid-decode: use const for unsigned char pointers to the EDID
  eee377b edid-decode: add support for QuantumData 980 EDID file format
  7d8f41f edid-decode: simplify data block parsing
  8c81ccf Add Samsung UE49KS8005 EDID
  ab18bef edid-decode: add HDMI Forum VSDB fields for HDMI 2.1b
  e9ffafc edid-decode: add options and new output formats
  b2da151 edid-decode: add --extract and --check options
  5eeb151 edid-decode: replace AdobeYCC/RGB by opYCC/RGB
  6def7bc edid-decode: make it easier to find the out-of-range monitor values

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/edid-decode/edid-decode.hash | 2 +-
 package/edid-decode/edid-decode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
index 437dcf4a66..12cd30e818 100644
--- a/package/edid-decode/edid-decode.hash
+++ b/package/edid-decode/edid-decode.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 94f43f93285eb5cf8133061295bcdf72b6897bf5372879c2e4032a08d359af12  edid-decode-f56f329ed23a25d002352dedba1e8f092a47286f.tar.gz
+sha256 27fcf4c8693ec6fe020b18c78c70ddba9a8b3ea8c55fcfad2a38103128ec5e36 edid-decode-6def7bc83dfb0338632e06a8b14c93faa6af8879.tar.gz
diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index b412a77a13..c43f1ae7da 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDID_DECODE_VERSION = f56f329ed23a25d002352dedba1e8f092a47286f
+EDID_DECODE_VERSION = 6def7bc83dfb0338632e06a8b14c93faa6af8879
 EDID_DECODE_SITE = git://linuxtv.org/edid-decode.git
 EDID_DECODE_LICENSE = MIT
 EDID_DECODE_LICENSE_FILES = edid-decode.c
