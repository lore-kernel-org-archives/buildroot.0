From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 22:34:06 +0100
Subject: [Buildroot] [git commit] package/exempi: use --disable-foo instead
 of --enable-foo=no
Message-ID: <20181230212944.867DF88172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac58fc650c49d52539a221f1f31d6f2e19d00203
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exempi/exempi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exempi/exempi.mk b/package/exempi/exempi.mk
index 73906e8e2b..e7b297ffe1 100644
--- a/package/exempi/exempi.mk
+++ b/package/exempi/exempi.mk
@@ -8,7 +8,7 @@ EXEMPI_VERSION = 2.4.5
 EXEMPI_SOURCE = exempi-$(EXEMPI_VERSION).tar.bz2
 EXEMPI_SITE = https://libopenraw.freedesktop.org/download
 EXEMPI_INSTALL_STAGING = YES
-EXEMPI_CONF_OPTS = --enable-unittest=no
+EXEMPI_CONF_OPTS = --disable-unittest
 EXEMPI_DEPENDENCIES = host-pkgconf expat zlib
 EXEMPI_LICENSE = BSD-3-Clause
 EXEMPI_LICENSE_FILES = COPYING
