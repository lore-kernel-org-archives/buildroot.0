From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 14:55:28 +0100
Subject: [Buildroot] [PATCH] pciutils: bump version
Message-ID: <1384178128-27587-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the release announcement e-mail:

I have just released version 3.2.1 of the pciutils. It's purely
a maintenance release with a couple of minor bug fixes and minor
improvements. Thus quoth the changelog:

2013-11-10  Martin Mares <mj@ucw.cz>

	* Released as 3.2.1.

	* CardBus bridge capabilities are displayed.

	* PCIe L1 PM substates are decoded.

	* Various bugs were fixed in decoding of PCIe capabilities.

	* The sysfs back-end does not spit out unnecessary warnings when
	  empty slots report only a partial device address. This actually
	  happens on IBM pSeries.

	* Updated pci.ids to the today's snapshot of the database.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pciutils/pciutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index fd6f8aa..16ba61b 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.2.0
+PCIUTILS_VERSION = 3.2.1
 PCIUTILS_SITE = ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
 PCIUTILS_INSTALL_STAGING = YES
 PCIUTILS_LICENSE = GPLv2+
-- 
1.8.1.2
