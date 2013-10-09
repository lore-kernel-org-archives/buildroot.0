From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 21:52:16 +0200
Subject: [Buildroot] [git commit] ccid: bump to version 1.4.12
Message-ID: <20131009202219.9BE1B9B9A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ead38a34f3889312b5eefe30e683d001747916d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version and also add license information.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ccid/ccid.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index a246ddd..c25b433 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.4.8
+CCID_VERSION = 1.4.12
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
-CCID_SITE = http://alioth.debian.org/frs/download.php/file/3768
+CCID_SITE = http://alioth.debian.org/frs/download.php/file/3937
+CCID_LICENSE = LGPLv2.1+
+CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
 CCID_DEPENDENCIES = pcsc-lite host-pkgconf libusb
 
