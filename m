From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 11:04:32 +0200
Subject: [Buildroot] [git commit] package/eudev: bump version to 3.1.2
Message-ID: <20150702090456.19C5D818D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7de0ff0ed49892f5c791c99f83198932a8708111
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: added locally calculated sha256 hash, as suggested by Yann.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eudev/eudev.hash |    4 +++-
 package/eudev/eudev.mk   |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index 7c750a9..d54c8cf 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,2 +1,4 @@
 # From http://dev.gentoo.org/~blueness/eudev/
-md5	d8d6b2ae5c9a740967b1ae2dccbae95b	eudev-3.1.1.tar.gz
+md5	07ab33fe310d250f06fc28f010e3fde2	eudev-3.1.2.tar.gz
+# Locally calculated
+sha256 4393b69e93dd8117defde6519b199d479f9d051f52061157a1a7a41b8fe10273 eudev-3.1.2.tar.gz
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index a97154c..87bce3e 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.1.1
+EUDEV_VERSION = 3.1.2
 EUDEV_SOURCE = eudev-$(EUDEV_VERSION).tar.gz
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
