From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jun 2013 10:30:37 +0200
Subject: [Buildroot] [git commit] pcsc-lite: fix download URL
Message-ID: <20130630083503.C55639B173@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17c956b9882a6bc407298ff7a7e8ec88b8ea74fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/832/832cb2f814fcdd30387b76622a75d4e6addbdc47/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pcsc-lite/pcsc-lite.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 5eab4e7..c126b3f 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -6,7 +6,7 @@
 
 PCSC_LITE_VERSION = 1.8.6
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
-PCSC_LITE_SITE = http://alioth.debian.org/frs/download.php/3757
+PCSC_LITE_SITE = http://alioth.debian.org/frs/download.php/file/3757
 PCSC_LITE_INSTALL_STAGING = YES
 PCSC_LITE_DEPENDENCIES = host-pkgconf
 PCSC_LITE_LICENSE = BSD-3c
