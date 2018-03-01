From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Mar 2018 23:17:32 +0100
Subject: [Buildroot] [git commit branch/next] package/libdrm: bump version
 to 2.4.90
Message-ID: <20180301222104.5D285814D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ced7bcbb253cf52f0d870cad3646d2c6a7d55adf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.hash | 10 +++++-----
 package/libdrm/libdrm.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 0842411c5a..b1784b4c07 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2017-December/160530.html
-md5 5307a147dde67ac643f6753a42b5d32c  libdrm-2.4.89.tar.bz2
-sha1 43123da26271df9a29deb687c1855bef3fed249c  libdrm-2.4.89.tar.bz2
-sha256 629f9782aabbb4809166de5f24d26fe0766055255038f16935602d89f136a02e  libdrm-2.4.89.tar.bz2
-sha512 380e4e46cd3971a73264bd1b482791fab0503268adb65ac81b674df009662cfb8ef5741e362f19670b2a43b1c46f022d857706c9a4bebed2b1cddaa317b7706d  libdrm-2.4.89.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-February/002838.html
+md5 61dcb4989c728f566e3c15c236585a17  libdrm-2.4.90.tar.bz2
+sha1 7630ba36c65433251a0494b47086fbd0b32ff7a8  libdrm-2.4.90.tar.bz2
+sha256 db37ec8f1dbaa2c192ad9903c8d0988b858ae88031e96f169bf76aaf705db68b  libdrm-2.4.90.tar.bz2
+sha512 3d32d60c44ffdcb58667d0926e6af8d375332add1f243d8b2d37567aeef4e4b26d786294aeecf46c3dea94fc002fb73756567c457300703acfc21e32ffbd458c  libdrm-2.4.90.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 1c898a5b54..7121f06c9a 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.89
+LIBDRM_VERSION = 2.4.90
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
