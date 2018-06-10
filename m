From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 13:24:45 +0200
Subject: [Buildroot] [git commit] package/pngquant: bump version to 2.12.0
Message-ID: <20180610120714.3AB5F880A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43ebb35e9b8cf935e62a67bd26468d70c45c5980
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pngquant/pngquant.hash | 4 ++--
 package/pngquant/pngquant.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pngquant/pngquant.hash b/package/pngquant/pngquant.hash
index a279100eca..f525e466c3 100644
--- a/package/pngquant/pngquant.hash
+++ b/package/pngquant/pngquant.hash
@@ -1,5 +1,5 @@
 # From https://pngquant.org/releases.html
-sha1 be140ec83c571b19219b639f2671b2316a2acaa1  pngquant-2.11.7-src.tar.gz
+sha1 f57ce0112e86ac966c55270ccf5971deff241d4f  pngquant-2.12.0-src.tar.gz
 # Locally computed
-sha256 d70b46c3335c7abf21944aced2d9d2b54819ab84ed1a140b354d5e8cc9f0fb0a  pngquant-2.11.7-src.tar.gz
+sha256 0e540c64bb58c05f2a05b4eaf1d3d165f0d3278500f15abfeac47f93f8fa8fa8  pngquant-2.12.0-src.tar.gz
 sha256 e4f467f7abf860b4e620f5f60fdd88bc3a63a0fdb98a481fb002b5e511c9b826  COPYRIGHT
diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index 20e5e763fb..26c293bec3 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PNGQUANT_VERSION = 2.11.7
+PNGQUANT_VERSION = 2.12.0
 PNGQUANT_SOURCE = pngquant-$(PNGQUANT_VERSION)-src.tar.gz
 PNGQUANT_SITE = https://pngquant.org
 PNGQUANT_LICENSE = GPL-3.0+
