From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 09:27:30 +0100
Subject: [Buildroot] [git commit] pcsc-lite: bump to version 1.8.10
Message-ID: <20131215090215.CEF2A9BFAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=82b41f0c7742d4b282aa9b6e4946247adfb29ef9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcsc-lite/pcsc-lite.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 4cc628f..afbe822 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.8.8
+PCSC_LITE_VERSION = 1.8.10
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
-PCSC_LITE_SITE = http://alioth.debian.org/frs/download.php/file/3862
+PCSC_LITE_SITE = http://alioth.debian.org/frs/download.php/file/3963
 PCSC_LITE_INSTALL_STAGING = YES
 PCSC_LITE_DEPENDENCIES = host-pkgconf
 PCSC_LITE_LICENSE = BSD-3c
