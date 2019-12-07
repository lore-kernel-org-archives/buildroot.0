From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Dec 2019 21:29:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/nss-pam-ldapd: bump to version
 0.9.11
Message-ID: <20191207202949.785569-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nss-pam-ldapd/nss-pam-ldapd.hash | 6 +++---
 package/nss-pam-ldapd/nss-pam-ldapd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.hash b/package/nss-pam-ldapd/nss-pam-ldapd.hash
index a4d189c1d4..47864c4fe7 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.hash
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.hash
@@ -1,5 +1,5 @@
-# From https://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.8.tar.gz.md5
-md5 8c99fdc54f4bf9aca8c5f53fdb1403ff  nss-pam-ldapd-0.9.8.tar.gz
+# From https://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.11.tar.gz.md5
+md5 91df9d46a548aa7aa95d0e7c672215d0  nss-pam-ldapd-0.9.8.tar.gz
 # Locally computed:
-sha256 ef7362e7f2003da8c7beb7bcc03c30494acf712625aaac8badc6e7eb16f3453f  nss-pam-ldapd-0.9.8.tar.gz
+sha256 d0d71be06d1a90940b7566ce00cef1a465aae7171d5d062785506a83411ecab6  nss-pam-ldapd-0.9.11.tar.gz
 sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.mk b/package/nss-pam-ldapd/nss-pam-ldapd.mk
index c094db96ac..15b3c4b95e 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.mk
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NSS_PAM_LDAPD_VERSION = 0.9.8
+NSS_PAM_LDAPD_VERSION = 0.9.11
 NSS_PAM_LDAPD_SITE = http://arthurdejong.org/nss-pam-ldapd
 NSS_PAM_LDAPD_LICENSE = LGPL-2.1+
 NSS_PAM_LDAPD_LICENSE_FILES = COPYING
-- 
2.24.0
