From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 14:12:49 +0200
Subject: [Buildroot] [git commit] package/x265: bump version to 2.8
Message-ID: <20180610121052.385B78489B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a73c944fa90199b1d16a66f3092c80cdf4ded6d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x265/x265.hash | 3 ++-
 package/x265/x265.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x265/x265.hash b/package/x265/x265.hash
index e6f22db646..61e6181199 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,2 +1,3 @@
 # Locally generated
-sha256 d5e75fa62ffe6ed49e691f8eb8ab8c1634ffcc0725dd553c6fdb4d5443b494a2  x265_2.7.tar.gz
+sha256 6e59f9afc0c2b87a46f98e33b5159d56ffb3558a49d8e3d79cb7fdc6b7aaa863  x265_2.8.tar.gz
+sha256 d8afb1bcc7a2cfc603683b168d6987ef0a48e59e0da3693bf55c5d33b67e2b49  COPYING
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 243025c08b..0ad27ee006 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X265_VERSION = 2.7
+X265_VERSION = 2.8
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
 X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
 X265_LICENSE = GPL-2.0+
