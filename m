From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 20:52:58 +0100
Subject: [Buildroot] [git commit branch/next] package/alsa-utils: bump to
 version to 1.1.7
Message-ID: <20181118195108.162778127C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23a974fa0b2a6910b9466ff9ce3fb494018f8049
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Zenichi Amano <crow.misia@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index ff8fd08013..f0468fb886 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 155caecc40b2220f686f34ba3655a53e3bdbc0586adb1056733949feaaf7d36e  alsa-utils-1.1.6.tar.bz2
+sha256 1db27fb54ab7fdeb54b00d68b8a174808ffea198cfbd67e3c959482194e1540a  alsa-utils-1.1.7.tar.bz2
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 0c65082a14..14d256fca7 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.1.6
+ALSA_UTILS_VERSION = 1.1.7
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
