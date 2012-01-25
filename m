From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Jan 2012 13:37:10 +0100
Subject: [Buildroot] [git commit] pciutils: bump version
Message-ID: <20120125140243.ECDA59056F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90a83c0b37a1de9e8d933fabacf9a45531654c1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pciutils/pciutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 28f80d4..37a17c4 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PCIUTILS_VERSION = 3.1.8
+PCIUTILS_VERSION = 3.1.9
 PCIUTILS_SITE = ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 	PCIUTILS_ZLIB=yes
