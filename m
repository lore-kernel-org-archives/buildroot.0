From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Apr 2020 16:59:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/openldap: bump version to 2.4.49
Message-ID: <20200412145935.1479219-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.openldap.org/hyperkitty/list/openldap-announce at openldap.org/thread/VMMBUCQHEDF6QA4CDOONP2CDQEOR5YQA/

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openldap/openldap.hash | 10 +++++-----
 package/openldap/openldap.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 9ea1e7a55d..7f159cb6d0 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,7 +1,7 @@
-# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.48.md5
-md5 0729a0711fe096831dedc159e0bbe73f  openldap-2.4.48.tgz
-# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.48.sha1
-sha1 c1984e80f6db038b317bf931866adb38e5537dcd  openldap-2.4.48.tgz
+# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.49.md5
+md5 2a47a6bb4319357ea7b032c45283e79e  openldap-2.4.49.tgz
+# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.49.sha1
+sha1 f0caeca122e6f90e6ac5cc8ba36fe9cec13826da  openldap-2.4.49.tgz
 # Locally computed
-sha256 d9523ffcab5cd14b709fcf3cb4d04e8bc76bb8970113255f372bc74954c6074d  openldap-2.4.48.tgz
+sha256 e3b117944b4180f23befe87d0dcf47f29de775befbc469dcf4ac3dab3311e56e  openldap-2.4.49.tgz
 sha256 310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 4417bb659b..a5f6067494 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.4.48
+OPENLDAP_VERSION = 2.4.49
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
-OPENLDAP_SITE = http://www.openldap.org/software/download/OpenLDAP/openldap-release
+OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
 OPENLDAP_LICENSE_FILES = LICENSE
 OPENLDAP_INSTALL_STAGING = YES
-- 
2.25.0
