From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Dec 2017 15:32:39 +0100
Subject: [Buildroot] [git commit] alsa-utils: bump to version 1.1.5
Message-ID: <20171222144124.0FA9D83562@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b3907d74c72859e594fb4c419bdf1e3effc9974
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license hash.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/alsa-utils.hash | 3 ++-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index 538990b..41cf946 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 a7831044de92c5bf33bf3365a3f36e49397f4191e934df460ae1ca15138c9d9d  alsa-utils-1.1.4.tar.bz2
+sha256 320bd285e91db6e7fd7db3c9ec6f55b02f35449ff273c7844780ac6a5a3de2e8  alsa-utils-1.1.5.tar.bz2
+sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index e9fd942..2d3407d 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.1.4
+ALSA_UTILS_VERSION = 1.1.5
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
