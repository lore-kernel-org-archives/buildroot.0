From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Feb 2018 23:47:48 +0100
Subject: [Buildroot] [git commit] package/libcodec2: fix upstream source URL
Message-ID: <20180204224808.426E7883A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d4a0473f27e35393f71e19441cb116ef311e305
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream changed to URL of the source tarball and removed SHA1SUMS.
Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcodec2/libcodec2.hash | 3 +--
 package/libcodec2/libcodec2.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libcodec2/libcodec2.hash b/package/libcodec2/libcodec2.hash
index 47483604cc..e401e9d30e 100644
--- a/package/libcodec2/libcodec2.hash
+++ b/package/libcodec2/libcodec2.hash
@@ -1,4 +1,3 @@
-# sha1 from http://files.freedv.org/codec2/SHA1SUMS
-sha1   8988aa33121b857d58a16f75b5061281b254a146	codec-0.7.tar.xz
 # Locally computed
 sha256 0695bb93cd985dd39f02f0db35ebc28a98b9b88747318f90774aba5f374eadb2  codec2-0.7.tar.xz
+sha256 9ebb6f82b7380a62ac74c5f0322c88e6744dedf2ebe1f54d6f088282b39844bf  COPYING
diff --git a/package/libcodec2/libcodec2.mk b/package/libcodec2/libcodec2.mk
index 7d1c6c3839..3253a35956 100644
--- a/package/libcodec2/libcodec2.mk
+++ b/package/libcodec2/libcodec2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCODEC2_VERSION = 0.7
-LIBCODEC2_SITE = http://files.freedv.org/codec2
+LIBCODEC2_SITE = https://freedv.com/wp-content/uploads/sites/8/2017/10
 LIBCODEC2_SOURCE = codec2-$(LIBCODEC2_VERSION).tar.xz
 LIBCODEC2_LICENSE = LGPL-2.1
 LIBCODEC2_LICENSE_FILES = COPYING
