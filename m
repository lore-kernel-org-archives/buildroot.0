From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 21 Sep 2020 18:29:39 +0200
Subject: [Buildroot] [PATCH] package/opkg-utils: bump to version 0.4.3
Message-ID: <20200921162939.726213-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/opkg-utils/opkg-utils.hash | 4 ++--
 package/opkg-utils/opkg-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opkg-utils/opkg-utils.hash b/package/opkg-utils/opkg-utils.hash
index d95286abc..471ce4c2f 100644
--- a/package/opkg-utils/opkg-utils.hash
+++ b/package/opkg-utils/opkg-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5a3071019715cf3066946ac9a57fcb51117c611a3114efc56894afc8b3b51b4c  opkg-utils-0.4.2.tar.gz
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  acb208fe32f93f7fc0f7fdf9f870c07e40a016bcb7fa07ada6c99503e033dafd  opkg-utils-0.4.3.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index 38137bc67..fa14053f6 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPKG_UTILS_VERSION = 0.4.2
+OPKG_UTILS_VERSION = 0.4.3
 OPKG_UTILS_SITE = http://git.yoctoproject.org/git/opkg-utils
 OPKG_UTILS_SITE_METHOD = git
 OPKG_UTILS_LICENSE = GPL-2.0+
-- 
2.25.1
