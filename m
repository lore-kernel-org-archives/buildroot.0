From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:06:41 +0100
Subject: [Buildroot] [git commit] package/mtdev: bump version to 1.1.5
Message-ID: <20191104210029.E0E2C8E67F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e9b5f314bdc77e1d8e45df7dff2794f6597c649
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mtdev/mtdev.hash | 3 ++-
 package/mtdev/mtdev.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mtdev/mtdev.hash b/package/mtdev/mtdev.hash
index 7ba5ffdf52..7ead723ef4 100644
--- a/package/mtdev/mtdev.hash
+++ b/package/mtdev/mtdev.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	6b59b055ff22f2b91d4284187c2515826c338b81f6f33bd90f6bedc7c1fb9a38	mtdev-1.1.4.tar.bz2
+sha256 6677d5708a7948840de734d8b4675d5980d4561171c5a8e89e54adf7a13eba7f  mtdev-1.1.5.tar.bz2
+sha256 795bfe74daae59a97d3a0c8ec0ba0f08c243adf94a3aa7981a4136fce31d55b4  COPYING
diff --git a/package/mtdev/mtdev.mk b/package/mtdev/mtdev.mk
index fc6ee4c46b..f4c38d5c41 100644
--- a/package/mtdev/mtdev.mk
+++ b/package/mtdev/mtdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTDEV_VERSION = 1.1.4
+MTDEV_VERSION = 1.1.5
 MTDEV_SOURCE = mtdev-$(MTDEV_VERSION).tar.bz2
 MTDEV_SITE = http://bitmath.org/code/mtdev
 
