From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 23:36:36 +0200
Subject: [Buildroot] [git commit] package/ofono: bump version to 1.20
Message-ID: <20170922213002.6767A7FDA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31f33cd073e851e9e4ceb46af0c8ea5696fdf4f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ofono/ofono.hash | 2 +-
 package/ofono/ofono.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index d611736..ef955a9 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256	53cdbf342913f46bce4827241c60e24255a3d43a94945edf77482ae5b312d51f  ofono-1.18.tar.xz
+sha256 5d7ba8f481a7715d013a79f8d6477eb89d8aaae399395d5d008a1317c34a31d5  ofono-1.20.tar.xz
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 88749aa..1aea2d4 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.18
+OFONO_VERSION = 1.20
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPL-2.0
