From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 23:13:25 +0200
Subject: [Buildroot] [git commit] package/libtorrent-rasterbar: bump version
 to 1.2.2
Message-ID: <20191007210751.A22F58B33B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6baf80dccee79295fbe99f3926701ae06fd0f875
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtorrent-rasterbar/libtorrent-rasterbar.hash | 2 +-
 package/libtorrent-rasterbar/libtorrent-rasterbar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
index 3e55d64a3e..5e81754aba 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 cceba9842ec7d87549cee9e39d95fd5ce68b0eb9b314a2dd0d611cfa9798762d libtorrent-rasterbar-1.2.1.tar.gz
+sha256 e579261d7f0acbe82e9b4ce703cb721627cb8075023f8a26405992f489bc6202 libtorrent-rasterbar-1.2.2.tar.gz
 sha256 f3a5dd1558cce616b12edad521427ec8976ce2bb0af33f7f359cfa648bf55ad8 COPYING
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index 1d132382e1..b512cc6037 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTORRENT_RASTERBAR_VERSION = 1.2.1
+LIBTORRENT_RASTERBAR_VERSION = 1.2.2
 LIBTORRENT_RASTERBAR_SITE = https://github.com/arvidn/libtorrent/releases/download/libtorrent-$(subst .,_,$(LIBTORRENT_RASTERBAR_VERSION))
 LIBTORRENT_RASTERBAR_LICENSE = BSD-3-Clause
 LIBTORRENT_RASTERBAR_LICENSE_FILES = COPYING
