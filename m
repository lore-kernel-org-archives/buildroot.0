From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:38:09 +0100
Subject: [Buildroot] [git commit] usbutils: add license info
Message-ID: <20121114214736.0F4CE99B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96948ce17577329e78b421b955cdc3decc12cbf6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/usbutils/usbutils.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 87ae4b3..05573ed 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -11,6 +11,8 @@ USBUTILS_DEPENDENCIES = host-pkgconf libusb
 USBUTILS_INSTALL_STAGING = YES
 # no configure in tarball
 USBUTILS_AUTORECONF = YES
+USBUTILS_LICENSE = GPLv2+
+USBUTILS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
 	USBUTILS_DEPENDENCIES += zlib
