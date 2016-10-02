From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Oct 2016 21:22:27 +0200
Subject: [Buildroot] [git commit] package/snappy: bump version
Message-ID: <20161002193142.A2DDD7FB10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31024e349262d2dbf4af1ed46c9c991c793d5823
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snappy/snappy.hash | 2 +-
 package/snappy/snappy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snappy/snappy.hash b/package/snappy/snappy.hash
index fc979ae..bb7f104 100644
--- a/package/snappy/snappy.hash
+++ b/package/snappy/snappy.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 d64e434e2ddfe9ae942708747003d489e27f2bfddaa5e9e070da98cb00f660f2  snappy-1ff9be9b8fafc8528ca9e055646f5932aa5db9c4.tar.gz
+sha256 f50719c6dc7103d65df66882a3b4569d598eda251266463eca716928187dc12b  snappy-32d6d7d8a2ef328a2ee1dd40f072e21f4983ebda.tar.gz
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index 6f89cf1..fcbcd13 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAPPY_VERSION = 1ff9be9b8fafc8528ca9e055646f5932aa5db9c4
+SNAPPY_VERSION = 32d6d7d8a2ef328a2ee1dd40f072e21f4983ebda
 SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3c
 SNAPPY_LICENSE_FILES = COPYING
