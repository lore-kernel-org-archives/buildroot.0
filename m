From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 18:02:02 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/openldap: bump to
 version 2.4.47
Message-ID: <20190902161353.6424E8A3F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cafa26a9549476d394f6ef126cfbc854c3fa6038
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3102d7d87cd9d8a378bdc1bdadca3ae368311bf4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openldap/openldap.hash | 10 +++++-----
 package/openldap/openldap.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 37e2673c4b..0b33b8d724 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,7 +1,7 @@
-# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.46.md5
-md5 829016c5a9f45c51adc50073ac6f9fd7  openldap-2.4.46.tgz
-# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.46.sha1
-sha1 a9ae2273eb9bdd70090dafe0d018a3132606bef6  openldap-2.4.46.tgz
+# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.47.md5
+md5 e508f97bfd778fec7799f286e5c07176  openldap-2.4.47.tgz
+# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.47.sha1
+sha1 c59d52dd75f7d1c7b02f83725da36c322d439674  openldap-2.4.47.tgz
 # Locally computed
-sha256 9a90dcb86b99ae790ccab93b7585a31fbcbeec8c94bf0f7ab0ca0a87ea0c4b2d  openldap-2.4.46.tgz
+sha256 f54c5877865233d9ada77c60c0f69b3e0bfd8b1b55889504c650047cc305520b  openldap-2.4.47.tgz
 sha256 310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 3f00f2b7df..9dbab731c3 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.4.46
+OPENLDAP_VERSION = 2.4.47
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = http://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
