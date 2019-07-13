From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 Jul 2019 14:32:33 +0200
Subject: [Buildroot] [PATCH 1/2] package/imagemagick: security bump to
 version 7.0.8-53
Message-ID: <20190713123234.9340-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes various CVE IDs:

CVE-2019-13133, CVE-2019-13134, CVE-2019-13135, CVE-2019-13136,
CVE-2019-13137, CVE-2019-13295, CVE-2019-13296, CVE-2019-13297,
CVE-2019-13298, CVE-2019-13299, CVE-2019-13300, CVE-2019-13301,
CVE-2019-13302, CVE-2019-13303, CVE-2019-13304, CVE-2019-13305,
CVE-2019-13306, CVE-2019-13307, CVE-2019-13308, CVE-2019-13309,
CVE-2019-13310, CVE-2019-13311, CVE-2019-13391

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index e89aa557c1..e5f8733d7a 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 2a1ca5f9c38e6596a5ee9fdbbaebba1d21b57618e892c72c8e4e63ced571af40  7.0.8-42.tar.gz
+sha256 b8c35e03fc4bd2bf66bddfe232a34473e7df68c3716c831ba76dc30520e7b490  7.0.8-53.tar.gz
 sha256 5b47db932754743460eba7a226aea85b63e3408d3c7affb4d0117f70c9594ded  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index be350e88ed..fff00fcfb1 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.8-42
+IMAGEMAGICK_VERSION = 7.0.8-53
 IMAGEMAGICK_SOURCE = $(IMAGEMAGICK_VERSION).tar.gz
 IMAGEMAGICK_SITE = https://github.com/ImageMagick/ImageMagick/archive
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.20.1
