From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2016 22:26:56 +0200
Subject: [Buildroot] [git commit] package/clamav: bump version to 0.99.2
Message-ID: <20160509202911.7EA4880DB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71ad4dadb6fb1e5543d11716f1ddcbde7bf77266
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changed upstream URL to project site clamav.net, the tarball for the
new version is not available on sourceforge.net anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/clamav/clamav.hash | 6 ++----
 package/clamav/clamav.mk   | 4 ++--
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index f80474b..d2a1a12 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,4 +1,2 @@
-# From http://sourceforge.net/projects/clamav/files/clamav/0.99.1/
-sha1	9b9706b951fbb35cf6743ef497649fdf20f167f9	clamav-0.99.1.tar.gz
-# Calculated based on the hash above
-sha256	e144689122d3f91293808c82cbb06b7d3ac9eca7ae29564c5d148ffe7b25d58a	clamav-0.99.1.tar.gz
+# Locally calculated
+sha256	167bd6a13e05ece326b968fdb539b05c2ffcfef6018a274a10aeda85c2c0027a	clamav-0.99.2.tar.gz
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 16178cd..6a82d66 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.99.1
-CLAMAV_SITE = http://sourceforge.net/projects/clamav/files/clamav/$(CLAMAV_VERSION)
+CLAMAV_VERSION = 0.99.2
+CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPLv2
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
 	COPYING.LGPL COPYING.llvm COPYING.lzma COPYING.pcre COPYING.regex \
