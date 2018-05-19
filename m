From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 13:57:41 +0200
Subject: [Buildroot] [git commit branch/next] package/pngquant: bump version
 to 2.11.7
Message-ID: <20180519115645.7D742885F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a90d1e9da5e96bfdf77164ae496596ba4974d2c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pngquant/pngquant.hash | 5 +++--
 package/pngquant/pngquant.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pngquant/pngquant.hash b/package/pngquant/pngquant.hash
index a3f1005d32..a279100eca 100644
--- a/package/pngquant/pngquant.hash
+++ b/package/pngquant/pngquant.hash
@@ -1,4 +1,5 @@
 # From https://pngquant.org/releases.html
-sha1 30f54b0731b8913a8c8b3bd1fdf53e1c68b12262  pngquant-2.10.1-src.tar.gz
+sha1 be140ec83c571b19219b639f2671b2316a2acaa1  pngquant-2.11.7-src.tar.gz
 # Locally computed
-sha256 e07a21fe37b6ae9fa5524f1e20a8e73b698566d42d2cc3edd469531745faa850  pngquant-2.10.1-src.tar.gz
+sha256 d70b46c3335c7abf21944aced2d9d2b54819ab84ed1a140b354d5e8cc9f0fb0a  pngquant-2.11.7-src.tar.gz
+sha256 e4f467f7abf860b4e620f5f60fdd88bc3a63a0fdb98a481fb002b5e511c9b826  COPYRIGHT
diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index f181d6fb47..20e5e763fb 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PNGQUANT_VERSION = 2.10.1
+PNGQUANT_VERSION = 2.11.7
 PNGQUANT_SOURCE = pngquant-$(PNGQUANT_VERSION)-src.tar.gz
 PNGQUANT_SITE = https://pngquant.org
 PNGQUANT_LICENSE = GPL-3.0+
