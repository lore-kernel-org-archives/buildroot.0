From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 22:33:11 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/libssh2: bump
 version
Message-ID: <20190327214546.3990B88102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d39c60da0e8d5e60ee8a0f107ceb06b8e4d03d64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Added license hash.

This bump includes "ECDSA key types are now explicit"
https://github.com/libssh2/libssh2/commit/62b825c8afb9e5efb6ea9c05b40b309590249fb6

which is needed by vlc since
http://git.videolan.org/?p=vlc.git;a=commitdiff;h=afee1e72a8e08866bbe35d1a57e859cac81052b4

Fixes
http://autobuild.buildroot.net/results/579/579e2418e59680ad4bf3dc85f2918457b6221bfa/
http://autobuild.buildroot.net/results/c73/c7348c442d3f585ace0bc62860f802dc08150776/
http://autobuild.buildroot.net/results/731/73187b883d7fe14b08a4903b326706c9d1f8b519/
http://autobuild.buildroot.net/results/f6d/f6d4fca6063c81a8e240fed4db89269e455f057e/
http://autobuild.buildroot.net/results/371/371f4f017f4a5af0ac6d6a8b1b8276858ad47f75/
http://autobuild.buildroot.net/results/d6a/d6a3b43211eb740bdebbb339668b854d26e878b7/
http://autobuild.buildroot.net/results/a05/a0576aeeb57a49958e5229d9ec08f2bd792d48b6/
http://autobuild.buildroot.net/results/57a/57a9ae2f157183a86fbf1b2cc5cbb38e948690ce/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9c31063b0fe4e73ade03d0d02d8d90cffc1bc191)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh2/libssh2.hash | 3 ++-
 package/libssh2/libssh2.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
index d36262ad9a..d57c8d7062 100644
--- a/package/libssh2/libssh2.hash
+++ b/package/libssh2/libssh2.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 e73d55cd512863aa6423c6e137039e3e1bcbf5ba87f130e7441132c2c78a5425 libssh2-616fd4d1b3e4a55de67c48819fefca83132126b5.tar.gz
+sha256 ec2b32b44ae5f8fe094f663f63953fb31314de838eb36e8c47e5a89137b5a1bc  libssh2-8b870ad771cbd9cd29edbb3dbb0878e950f868ab.tar.gz
+sha256 e15ed284a15e80115467d6d7f030f0d89d8fabbecd78fb6e0f861f0cfc128fd9  COPYING
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index c5b0bd855e..0e13701b29 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSSH2_VERSION = 616fd4d1b3e4a55de67c48819fefca83132126b5
+LIBSSH2_VERSION = 8b870ad771cbd9cd29edbb3dbb0878e950f868ab
 LIBSSH2_SITE = $(call github,libssh2,libssh2,$(LIBSSH2_VERSION))
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
