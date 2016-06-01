From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 Jun 2016 20:22:40 +0200
Subject: [Buildroot] [git commit] libiio: fix legal info
Message-ID: <20160601182327.5194980250@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86365cbe9f3d4d0d61bd8a1023f0c0a73683a36b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/778/7789da71553bb633cbea6db83faeee061155b9f8/

The license file is now called COPYING.txt.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiio/libiio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index e5edb5c..6479e6f 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -8,7 +8,7 @@ LIBIIO_VERSION = 0.6
 LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
 LIBIIO_INSTALL_STAGING = YES
 LIBIIO_LICENSE = LGPLv2.1+
-LIBIIO_LICENSE_FILES = COPYING
+LIBIIO_LICENSE_FILES = COPYING.txt
 
 LIBIIO_CONF_OPTS = -DENABLE_IPV6=ON \
 	-DWITH_LOCAL_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_LOCAL_BACKEND),ON,OFF) \
