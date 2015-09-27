From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Sep 2015 23:20:08 +0200
Subject: [Buildroot] [git commit] package/genimage: bump version to 8
Message-ID: <20150928192055.3287B7FFA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b961b8765ced4852109ed5f967f520ab1a3812e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new version fixes segmentation faults on some platforms.

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Tested-by: Gergely Imreh <imrehg@gmail.com>
Tested-by: Gergely Imreh <imrehg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/genimage/genimage.hash |    2 +-
 package/genimage/genimage.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index 71b7601..b01ea46 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	7366dcfe4c542298ffe8a6c8d3551b1c3a84e25bfbb76ca75b9692e974f4534a	genimage-7.tar.xz
+sha256	363b2222b8036eca927c464994e7a877539adc3ea9ba895c1e2186f0589fafbf	genimage-8.tar.xz
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 07d95a4..2dffbc5 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 7
+GENIMAGE_VERSION = 8
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
 GENIMAGE_DEPENDENCIES = host-pkgconf libconfuse
