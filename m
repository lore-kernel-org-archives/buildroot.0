From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Apr 2020 18:22:29 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/quagga: install
 quagga to staging
Message-ID: <20200407180222.3D2DF8D596@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73e918edd54e7da06c6ac2f346133b9dec1d1327
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

quagga installs libraries that provide interfaces to manage network routing
that can be used by other applications.

Signed-off-by: Graham Rhodes <graham.rhodes@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1e3cd85e7a6d81036d81f5cbf382065a007ee847)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quagga/quagga.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 96a971104b..0b352aa367 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -6,6 +6,7 @@
 
 QUAGGA_VERSION = 1.2.4
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
+QUAGGA_INSTALL_STAGING = YES
 QUAGGA_DEPENDENCIES = host-gawk host-pkgconf
 QUAGGA_LICENSE = GPL-2.0+
 QUAGGA_LICENSE_FILES = COPYING
