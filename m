From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 22 Dec 2017 12:27:38 +0200
Subject: [Buildroot] [PATCH 2/2] alsa-utils: bump to version 1.1.5
In-Reply-To: <75cacfeecb3050ab53925db150892c8034ab0303.1513938458.git.baruch@tkos.co.il>
References: <75cacfeecb3050ab53925db150892c8034ab0303.1513938458.git.baruch@tkos.co.il>
Message-ID: <e7158ecb6f16affaf08a4b155450051a7162aa2d.1513938458.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license hash.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/alsa-utils/alsa-utils.hash | 3 ++-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index 538990bdedba..41cf946bd4b3 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 a7831044de92c5bf33bf3365a3f36e49397f4191e934df460ae1ca15138c9d9d  alsa-utils-1.1.4.tar.bz2
+sha256 320bd285e91db6e7fd7db3c9ec6f55b02f35449ff273c7844780ac6a5a3de2e8  alsa-utils-1.1.5.tar.bz2
+sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index e9fd942e57d7..2d3407d422ec 100644
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
-- 
2.15.1
