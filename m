From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2020 21:31:13 +0100
Subject: [Buildroot] [git commit] package/stellarium: bump version to 0.19.3
Message-ID: <20200105202819.1AF988079B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=306aa32fd89669c8c174fc0af28a37fc5b198e43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stellarium/stellarium.hash | 6 +++---
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index b1dc380f77..ea1256df1b 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,6 +1,6 @@
 # From https://github.com/Stellarium/stellarium/releases
-md5 5839f542f100b75031802b7ea6930854   stellarium-0.19.2.tar.gz
-sha1 49dd7405e5be98e003829f5c220f780b68a1dc31  stellarium-0.19.2.tar.gz
+md5 2de84da8a2256f3239174e3ad8f83a5b  stellarium-0.19.3.tar.gz
+sha1 a82cfa21c8dcfbd0a0cf4e30c4ea017ceb2f87a5  stellarium-0.19.3.tar.gz
 # Locally computed
-sha256 e4d005c5473e3be15b3101585e8959f422437147a602b1649e4aba22a92e6081  stellarium-0.19.2.tar.gz
+sha256 176e15d8d18340cf8c8cfed14f364cbda345d94e77cc97589c163c45d9cb225d  stellarium-0.19.3.tar.gz
 sha256 3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index d54f3572ca..ff1eb27018 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 0.19.2
+STELLARIUM_VERSION = 0.19.3
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
