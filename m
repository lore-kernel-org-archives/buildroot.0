From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 23:13:48 +0100
Subject: [Buildroot] [git commit] package/x264: bump version
Message-ID: <20210316215019.915F48829E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec0b716c4b7c553ca32445e1fb33a9ef0eec4918
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformatted hashes.

Switch _SITE* according to
http://download.videolan.org/x264/snapshots/x264-snapshot-20191218-README.txt

"The snapshotting service is discontinued.

 Please use https://code.videolan.org/videolan/x264/ to get the
 tarballs."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x264/x264.hash | 4 ++--
 package/x264/x264.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x264/x264.hash b/package/x264/x264.hash
index 93242a46cc..f1396279f8 100644
--- a/package/x264/x264.hash
+++ b/package/x264/x264.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0bb67d095513391e637b3b47e8efc3ba4603c3844f1b4c2690f4d36da7763055  x264-snapshot-20191217-2245.tar.bz2
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  58f39bf23a4e38ac3dd841a3f9ccf2aa16d2b0c35df9aecd9f3b5062780e5d74  x264-35417dcd65a57321fbadf98c9a4cff1cb741db4b-br1.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 9d217d1912..9de618eb5e 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-X264_VERSION = 20191217-2245
-X264_SITE = http://download.videolan.org/x264/snapshots
-X264_SOURCE = x264-snapshot-$(X264_VERSION).tar.bz2
+X264_VERSION = 35417dcd65a57321fbadf98c9a4cff1cb741db4b
+X264_SITE = https://code.videolan.org/videolan/x264.git
+X264_SITE_METHOD = git
 X264_LICENSE = GPL-2.0+
 X264_DEPENDENCIES = host-pkgconf
 X264_LICENSE_FILES = COPYING
