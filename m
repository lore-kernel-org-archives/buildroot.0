From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 14:55:22 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 18.0.3
Message-ID: <20180508125509.F1FED8B8C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dacc2899e287b2beb2f0afad074e911cd792a914
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 3a1e62fe66..5a8e3f9b84 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.0.2
+MESA3D_HEADERS_VERSION = 18.0.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 734df00306..983c0e65e5 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-April/000423.html
-md5 3c303da98ec2ce37c795baeba5aee31e  mesa-18.0.2.tar.xz
-sha1 2c8a500c48fdf68949328506916405936d99ee97  mesa-18.0.2.tar.xz
-sha256 98fa159768482dc568b9f8bf0f36c7acb823fa47428ffd650b40784f16b9e7b3  mesa-18.0.2.tar.xz
-sha512 77d24d01c4c22596d28421aeb74932ff232730a4f556ae1a2e8777ece2876e4e352679575385c065505df4a2a83d2c1cf30db92dcf88038417e36a2768332d7e  mesa-18.0.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-May/000426.html
+md5 b260580a26b71a5e52c608e3fe6d08a6  mesa-18.0.3.tar.xz
+sha1 2c12c9f69eb7ba787dd1245b53bb98ceb08362d3  mesa-18.0.3.tar.xz
+sha256 099d9667327a76a61741a533f95067d76ea71a656e66b91507b3c0caf1d49e30  mesa-18.0.3.tar.xz
+sha512 decd050bab049d17bcde3f832d4da0ffdb80f147c99377a162739bbe72fd6fd32b51e56e6fc66895b8c30fc19a1815bae164b21aa557816c3998ad18c1ffca2d  mesa-18.0.3.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 a75ee0cec909515ff80a3ec07155b7fb0aafe8051abe1f0e45d5c4c5e2539366  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index fb9189741f..d897c0d4c2 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.0.2
+MESA3D_VERSION = 18.0.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
