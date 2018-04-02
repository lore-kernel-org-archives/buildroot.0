From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 17:40:31 +0200
Subject: [Buildroot] [git commit] package/openldap: bump version to 2.4.46
Message-ID: <20180402154039.37FDD81096@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a10d5f77f001f20a174b65fcb9aa9d25b13ed98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://www.openldap.org/software/release/changes.html

Added sha256 hashes for tarball and license.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openldap/openldap.hash | 11 +++++++----
 package/openldap/openldap.mk   |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index aec4aaebfd..37e2673c4b 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,4 +1,7 @@
-# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.45.md5
-md5 00ff8301277cdfd0af728a6927042a13  openldap-2.4.45.tgz
-# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.45.sha1
-sha1 c98437385d3eaee80c9e2c09f3f0d4b7c140233d  openldap-2.4.45.tgz
+# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.46.md5
+md5 829016c5a9f45c51adc50073ac6f9fd7  openldap-2.4.46.tgz
+# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.46.sha1
+sha1 a9ae2273eb9bdd70090dafe0d018a3132606bef6  openldap-2.4.46.tgz
+# Locally computed
+sha256 9a90dcb86b99ae790ccab93b7585a31fbcbeec8c94bf0f7ab0ca0a87ea0c4b2d  openldap-2.4.46.tgz
+sha256 310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 2bf6fc3f27..6dd2390923 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.4.45
+OPENLDAP_VERSION = 2.4.46
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = http://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
