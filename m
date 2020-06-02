From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 02 Jun 2020 20:01:51 -0000
Subject: [Buildroot] [git commit] package/libnetconf2: bump to version 1.1.24
Message-ID: <20200602200120.80BD48256A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e683608da103cd885dd3df0083193188bef3847
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The LICENSE file hash changed due to Copyright year updating to include 2020.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnetconf2/libnetconf2.hash | 4 ++--
 package/libnetconf2/libnetconf2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index a73cb0ce91..f49972e957 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  35a1048754d6440674a193e4807b7cab5d03613b384436b67ef976ab3b1a2d01  libnetconf2-1.1.7.tar.gz
-sha256  085122ea91161812dda9cd2f42d8c50ecc3a48cc1a4f15044d86cfc5aa887577  LICENSE
+sha256  1a69db028bf970f0dab15ed508b58e0cf0806a7e4492828404b75c97ec8ab306  libnetconf2-1.1.24.tar.gz
+sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 724e4993bb..4ef3d85b17 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 1.1.7
+LIBNETCONF2_VERSION = 1.1.24
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
