From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 22:01:35 +0200
Subject: [Buildroot] [git commit] package/pngquant: bump version to 2.10.1
Message-ID: <20170905195415.1CAE2817A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e4935586226880b1b6d772cd89f8299f5ffc181
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pngquant/pngquant.hash | 4 ++--
 package/pngquant/pngquant.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pngquant/pngquant.hash b/package/pngquant/pngquant.hash
index c9f449e..a3f1005 100644
--- a/package/pngquant/pngquant.hash
+++ b/package/pngquant/pngquant.hash
@@ -1,4 +1,4 @@
 # From https://pngquant.org/releases.html
-sha1 08ed436e21429d4983bee0fe069681c458f95209  pngquant-2.9.1-src.tar.gz
+sha1 30f54b0731b8913a8c8b3bd1fdf53e1c68b12262  pngquant-2.10.1-src.tar.gz
 # Locally computed
-sha256 ac2138207ef40acd4e5fdae18798139a9d75dae4f1d0837aea918a2a8c433481  pngquant-2.9.1-src.tar.gz
+sha256 e07a21fe37b6ae9fa5524f1e20a8e73b698566d42d2cc3edd469531745faa850  pngquant-2.10.1-src.tar.gz
diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index f0104fb..a602cbe 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PNGQUANT_VERSION = 2.9.1
+PNGQUANT_VERSION = 2.10.1
 PNGQUANT_SOURCE = pngquant-$(PNGQUANT_VERSION)-src.tar.gz
 PNGQUANT_SITE = https://pngquant.org
 PNGQUANT_LICENSE = GPL-3.0+
