From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 15:06:11 +0100
Subject: [Buildroot] [git commit] pciutils: bump version
Message-ID: <20131111140726.E80219BBC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6820059edcfe6991830aa7d82db59689d0504019
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pciutils/pciutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
