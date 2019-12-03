From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 13:18:58 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libftdi: remove
 unused license
Message-ID: <20191203121317.F135383CB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfe7749fba7b6e1cf653816463988120cf5c60ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Commit 9b0b15e90b (package/libftdi: add license) was too hastily fixed,
with confusion between libftdi and libftdi1. The MIT-licensed file is
not present in libftdi; it is only in libftdi1.

Remove the unused MIT license from the list.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4a8f06e0f23facc9c648333a0a0f72cb8ca684e3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libftdi/libftdi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index f5d557183f..cafa40eed4 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -6,7 +6,7 @@
 
 LIBFTDI_VERSION = 0.20
 LIBFTDI_SITE = http://www.intra2net.com/en/developer/libftdi/download
-LIBFTDI_LICENSE = LGPL-2.1 (libftdi), MIT (libftdi)
+LIBFTDI_LICENSE = LGPL-2.1 (libftdi)
 LIBFTDI_LICENSE_FILES = LICENSE COPYING.LIB
 LIBFTDI_DEPENDENCIES = libusb-compat libusb
 HOST_LIBFTDI_DEPENDENCIES = host-libusb-compat host-libusb
