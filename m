From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 Sep 2018 20:46:06 +0200
Subject: [Buildroot] [PATCH 8/8] semodule-utils: bump to version 2.8
In-Reply-To: <20180916184606.27835-1-fontaine.fabrice@gmail.com>
References: <20180916184606.27835-1-fontaine.fabrice@gmail.com>
Message-ID: <20180916184606.27835-8-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/semodule-utils/semodule-utils.hash | 5 ++++-
 package/semodule-utils/semodule-utils.mk   | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/semodule-utils/semodule-utils.hash b/package/semodule-utils/semodule-utils.hash
index 18c8217ca6..be40918de6 100644
--- a/package/semodule-utils/semodule-utils.hash
+++ b/package/semodule-utils/semodule-utils.hash
@@ -1,2 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 90c98b3362a43b4da2a51a9176820a56f3e615225e23e3395bc566c4490786ba semodule-utils-2.7.tar.gz
+sha256 44f59c13070c637440b143ceab4dfe1efb9018b1e47828dd8789def74c1ccadf semodule-utils-2.8.tar.gz
+
+# Hash for license file
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/semodule-utils/semodule-utils.mk b/package/semodule-utils/semodule-utils.mk
index 8f07fa0a81..480e157c6d 100644
--- a/package/semodule-utils/semodule-utils.mk
+++ b/package/semodule-utils/semodule-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SEMODULE_UTILS_VERSION = 2.7
-SEMODULE_UTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
+SEMODULE_UTILS_VERSION = 2.8
+SEMODULE_UTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524
 SEMODULE_UTILS_LICENSE = GPL-2.0
 SEMODULE_UTILS_LICENSE_FILES = COPYING
 SEMODULE_UTILS_DEPENDENCIES = libsepol
-- 
2.17.1
