From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 22:24:08 +0200
Subject: [Buildroot] [git commit] package/eudev: Bump version to 1.7
Message-ID: <20140611202619.354189CFCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb7cf0d386b8a89ee8db3af9c7c46480efffdbc7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eudev/eudev.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index fc9c7d9..5f1525c 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = v1.6
+EUDEV_VERSION = v1.7
 EUDEV_SITE = $(call github,gentoo,eudev,$(EUDEV_VERSION))
 EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
