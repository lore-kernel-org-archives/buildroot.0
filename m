From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 22:21:30 +0100
Subject: [Buildroot] [git commit] package/openldap: bump to version 2.4.57
Message-ID: <20210125210149.23336814D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46c4c9684d24109f60711d1adb65ff19965edf05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.openldap.org/software/release/changes.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openldap/openldap.hash | 10 +++++-----
 package/openldap/openldap.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 4908f6e69e..f2ffdf53bc 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,7 +1,7 @@
-# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.56.md5
-md5  82a7dcf7aeaf95fdad16017c0ed9983a  openldap-2.4.56.tgz
-# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.56.sha1
-sha1  4c617b87bd50ef8d071e7deb7525af79b08d4910  openldap-2.4.56.tgz
+# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.57.md5
+md5  e3349456c3a66e5e6155be7ddc3f042c  openldap-2.4.57.tgz
+# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.57.sha1
+sha1  1cffa70a3ea8545948041fd113f8f53bc24d6d87  openldap-2.4.57.tgz
 # Locally computed
-sha256  25520e0363c93f3bcb89802a4aa3db33046206039436e0c7c9262db5a61115e0  openldap-2.4.56.tgz
+sha256  c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec822628bc220f6b45a  openldap-2.4.57.tgz
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 1a7149320d..b4c06d8640 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.4.56
+OPENLDAP_VERSION = 2.4.57
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
