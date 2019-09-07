From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 23:04:40 +0200
Subject: [Buildroot] [git commit] package/libebur128: bump version to 1.2.4
Message-ID: <20190907211229.4C8E08D3E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0c1c6c9e2dfb7ae30d8e60844144e3e710f8172
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libebur128/libebur128.hash | 2 +-
 package/libebur128/libebur128.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libebur128/libebur128.hash b/package/libebur128/libebur128.hash
index 89f6e1aa1c..e2285bc7cf 100644
--- a/package/libebur128/libebur128.hash
+++ b/package/libebur128/libebur128.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 1d0d7e855da04010a2432e11fbc596502caf11b61c3b571ccbcb10095fe44b43  libebur128-1.2.2.tar.gz
+sha256 2ee41a3a5ae3891601ae975d5ec2642b997d276ef647cf5c5b363b6127f7add8  libebur128-1.2.4.tar.gz
 sha256 d6b4754bb67bdd08b97d5d11b2d7434997a371585a78fe77007149df3af8d09c  COPYING
diff --git a/package/libebur128/libebur128.mk b/package/libebur128/libebur128.mk
index 7210e4f447..97c1bdbbd9 100644
--- a/package/libebur128/libebur128.mk
+++ b/package/libebur128/libebur128.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEBUR128_VERSION = 1.2.2
+LIBEBUR128_VERSION = 1.2.4
 LIBEBUR128_SITE = $(call github,jiixyj,libebur128,v$(LIBEBUR128_VERSION))
 LIBEBUR128_LICENSE = MIT
 LIBEBUR128_LICENSE_FILES = COPYING
