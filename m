From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Jan 2020 23:56:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/opkg-utils: bump to version 0.4.2
Message-ID: <20200128225600.101716-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opkg-utils/opkg-utils.hash | 3 ++-
 package/opkg-utils/opkg-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/opkg-utils/opkg-utils.hash b/package/opkg-utils/opkg-utils.hash
index 332823f2cb..d95286abc8 100644
--- a/package/opkg-utils/opkg-utils.hash
+++ b/package/opkg-utils/opkg-utils.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 c14284d999cdd18fee4c6b22720f38beee962b2c8e099166d8d55d76a2111beb  opkg-utils-0.3.4.tar.gz
+sha256 5a3071019715cf3066946ac9a57fcb51117c611a3114efc56894afc8b3b51b4c  opkg-utils-0.4.2.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index df202220d2..38137bc67b 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPKG_UTILS_VERSION = 0.3.4
+OPKG_UTILS_VERSION = 0.4.2
 OPKG_UTILS_SITE = http://git.yoctoproject.org/git/opkg-utils
 OPKG_UTILS_SITE_METHOD = git
 OPKG_UTILS_LICENSE = GPL-2.0+
-- 
2.24.1
