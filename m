From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 21:34:54 +0200
Subject: [Buildroot] [git commit] alsa-utils: bump version to 1.1.6
Message-ID: <20180415193747.4815588422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c94d840723718c75b49679eacd8e7be69e6c6b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index 41cf946bd4..ff8fd08013 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 320bd285e91db6e7fd7db3c9ec6f55b02f35449ff273c7844780ac6a5a3de2e8  alsa-utils-1.1.5.tar.bz2
+sha256 155caecc40b2220f686f34ba3655a53e3bdbc0586adb1056733949feaaf7d36e  alsa-utils-1.1.6.tar.bz2
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 2d3407d422..9b2e64b1d3 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.1.5
+ALSA_UTILS_VERSION = 1.1.6
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
