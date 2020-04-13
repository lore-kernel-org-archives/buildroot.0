From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2020 22:23:01 +0200
Subject: [Buildroot] [git commit] package/alsa-utils: bump version to 1.2.2
Message-ID: <20200413200934.427038EB18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4467984f319f24637e6308208d52b20c2c212377
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/alsa-utils/alsa-utils.hash | 4 ++--
 package/alsa-utils/alsa-utils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index 2c55ce6217..3db06ab4c1 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 0b110ba71ef41d3009db1bc4dcae0cf79efb99cb5426fa19d0312470560a2c0d  alsa-utils-1.2.1.tar.bz2
-sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  44807bd578c5f6df6e91a11b8d37e546424a5a1ea8d8e659ee359fe01730e4f3  alsa-utils-1.2.2.tar.bz2
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 2cd3c4a333..7afa36d503 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.2.1
+ALSA_UTILS_VERSION = 1.2.2
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
-ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
+ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
 ALSA_UTILS_LICENSE_FILES = COPYING
 ALSA_UTILS_INSTALL_STAGING = YES
