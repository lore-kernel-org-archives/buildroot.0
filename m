From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jun 2018 16:31:57 +0200
Subject: [Buildroot] [git commit] package/cryptodev-linux: bump to the
 latest version (f60aa0)
Message-ID: <20180608143153.E50557F9DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9314ad18708dbe164bd7eb20b01d0693d6509463
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumps the cryptodev-linux package to the latest version available, which
contains some fixes and allows to use cryptodev-linux with a recent
kernel (v4.17).

The patch bumps the version and update the locally calculated hash.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptodev-linux/cryptodev-linux.hash | 2 +-
 package/cryptodev-linux/cryptodev-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
index 48d608e127..ad7cb615e6 100644
--- a/package/cryptodev-linux/cryptodev-linux.hash
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 90a4c5e46d7d5fcc0c6155f1add824e73c27de9b1ff0b7fe2017a104cf9398dd cryptodev-linux-0a54e38b264d9a3bed74c642a61b88191660d0f8.tar.gz
+sha256 994ed2f715dd3786f534d5215ae7ae4735b84cff28ea41080ff3501bf1503944 cryptodev-linux-f60aa08c63fc02780554a0a12180a478ca27d49f.tar.gz
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index dacb29dab8..028f7b1df4 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTODEV_LINUX_VERSION = 0a54e38b264d9a3bed74c642a61b88191660d0f8
+CRYPTODEV_LINUX_VERSION = f60aa08c63fc02780554a0a12180a478ca27d49f
 CRYPTODEV_LINUX_SITE = $(call github,cryptodev-linux,cryptodev-linux,$(CRYPTODEV_LINUX_VERSION))
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPL-2.0+
