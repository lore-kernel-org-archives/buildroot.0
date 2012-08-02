From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:50 -0000
Subject: [Buildroot] [git commit branch/next] pciutils: bump to version
	3.1.10
Message-ID: <20120802195246.F2F658C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=edd37ca20583e3ae49f386b03ca213c9ae2cb065
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pciutils/pciutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index d1c8db5..a43fb95 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PCIUTILS_VERSION = 3.1.9
+PCIUTILS_VERSION = 3.1.10
 PCIUTILS_SITE = ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
 PCIUTILS_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_ZLIB),y)
