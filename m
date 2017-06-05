From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 14:36:35 +0200
Subject: [Buildroot] [git commit] alsa-lib: bump version to 1.1.4.1
Message-ID: <20170605123641.6499281F76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=454e9166e4e21edc3b48102a0aa6c8adb4a52434
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-lib/alsa-lib.hash | 2 +-
 package/alsa-lib/alsa-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index bcfadce..cf2a705 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 82f50a09487079755d93e4c9384912196995bade6280bce9bfdcabf094bfb515  alsa-lib-1.1.4.tar.bz2
+sha256 91bb870c14d1c7c269213285eeed874fa3d28112077db061a3af8010d0885b76  alsa-lib-1.1.4.1.tar.bz2
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 049c28f..12fa408 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.1.4
+ALSA_LIB_VERSION = 1.1.4.1
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
