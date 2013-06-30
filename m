From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jun 2013 10:31:31 +0200
Subject: [Buildroot] [git commit] ccid: fix download URL
Message-ID: <20130630083504.A55C99ADB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d78b4dc89ebe4047d63402cb347218ac754a34d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/ded/ded58e623bb2d1c95a7b46fc85d5aacdac5da01c/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ccid/ccid.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index d6c2213..6604bc1 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -6,7 +6,7 @@
 
 CCID_VERSION = 1.4.8
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
-CCID_SITE = http://alioth.debian.org/frs/download.php/3768
+CCID_SITE = http://alioth.debian.org/frs/download.php/file/3768
 CCID_INSTALL_STAGING = YES
 CCID_DEPENDENCIES = pcsc-lite host-pkgconf libusb
 
