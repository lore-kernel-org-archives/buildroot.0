From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jul 2013 22:10:14 +0200
Subject: [Buildroot] [git commit] libusb-compat: define license
Message-ID: <20130710202006.62A2D9A196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=326915e43dc3a9f26d47fdb24200899d1822cd61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libusb-compat/libusb-compat.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 8b4b0f6..8f2726e 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -10,6 +10,8 @@ LIBUSB_COMPAT_SITE = http://downloads.sourceforge.net/project/libusb/libusb-comp
 LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf libusb
 LIBUSB_COMPAT_INSTALL_STAGING = YES
 LIBUSB_COMPAT_CONFIG_SCRIPTS = libusb-config
+LIBUSB_COMPAT_LICENSE = LGPLv2.1+
+LIBUSB_COMPAT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
