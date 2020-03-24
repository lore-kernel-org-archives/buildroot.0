From: Graham Rhodes <graham.rhodes@rockwellcollins.com>
Date: Tue, 24 Mar 2020 08:22:22 -0500
Subject: [Buildroot] [PATCH] package/quagga: install quagga to staging
Message-ID: <20200324132223.177326-1-graham.rhodes@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.23.0
