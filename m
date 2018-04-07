From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Apr 2018 19:55:45 +0200
Subject: [Buildroot] [PATCH 1/1] libcap-ng: bump to version 0.7.9
Message-ID: <20180407175545.32225-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcap-ng/libcap-ng.hash | 2 +-
 package/libcap-ng/libcap-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
index b433b75063..8058ed9e97 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 c21af997445cd4107a55d386f955c5ea6f6e96ead693e9151277c0ab5f97d05f libcap-ng-0.7.8.tar.gz
+sha256 4a1532bcf3731aade40936f6d6a586ed5a66ca4c7455e1338d1f6c3e09221328 libcap-ng-0.7.9.tar.gz
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 568f167b48..990c675018 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.7.8
+LIBCAP_NG_VERSION = 0.7.9
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.14.1
