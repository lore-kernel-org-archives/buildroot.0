From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 21:28:08 +0100
Subject: [Buildroot] [git commit] package/quagga: install quagga to staging
Message-ID: <20200324201514.9D59A880CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e3cd85e7a6d81036d81f5cbf382065a007ee847
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

quagga installs libraries that provide interfaces to manage network routing
that can be used by other applications.

Signed-off-by: Graham Rhodes <graham.rhodes@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
