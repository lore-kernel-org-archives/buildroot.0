From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:36 -0000
Subject: [Buildroot] [git commit] package/exempi: bump to version 2.5.1
Message-ID: <20190903133620.339FB81413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97aaf2963b6d11189ce8bcced4aa188360fb548b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ilya Averyanov <averyanovin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exempi/exempi.hash | 2 +-
 package/exempi/exempi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exempi/exempi.hash b/package/exempi/exempi.hash
index 562a4d9b75..e8b71a483e 100644
--- a/package/exempi/exempi.hash
+++ b/package/exempi/exempi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 406185feb88e84ea1d4b4251370be2991205790d7113a7e28e192ff46a4f221e  exempi-2.4.5.tar.bz2
+sha256 100b3d5b1b3370bc2e31c0978991716c4a4478246a2ac2df6382054a0ae89bc8  exempi-2.5.1.tar.bz2
 sha256 3d3c3593c15e0d35bdae0df7c642106250f6be3adc61477419413900f23ae607  COPYING
diff --git a/package/exempi/exempi.mk b/package/exempi/exempi.mk
index 91b1d5da1f..2b6bd4fa81 100644
--- a/package/exempi/exempi.mk
+++ b/package/exempi/exempi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXEMPI_VERSION = 2.4.5
+EXEMPI_VERSION = 2.5.1
 EXEMPI_SOURCE = exempi-$(EXEMPI_VERSION).tar.bz2
 EXEMPI_SITE = https://libopenraw.freedesktop.org/download
 EXEMPI_INSTALL_STAGING = YES
