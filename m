From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 16:27:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/nss-pam-ldapd: bump version to 0.9.8
Message-ID: <20170913142702.14558-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nss-pam-ldapd/nss-pam-ldapd.hash | 6 +++---
 package/nss-pam-ldapd/nss-pam-ldapd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.hash b/package/nss-pam-ldapd/nss-pam-ldapd.hash
index b931e6fc12..66cb794063 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.hash
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.hash
@@ -1,4 +1,4 @@
-# From http://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.6.tar.gz.md5
-md5	fa5ec49cb54428d6c73e244a11021695	nss-pam-ldapd-0.9.6.tar.gz
+# From https://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.8.tar.gz.md5
+md5 8c99fdc54f4bf9aca8c5f53fdb1403ff  nss-pam-ldapd-0.9.8.tar.gz
 # Locally computed:
-sha256	101d5a7fa10549cc77be48d07f2b8141f59182f10f2cc0fea93efd13c3a5a6f2	nss-pam-ldapd-0.9.5.tar.gz
+sha256 ef7362e7f2003da8c7beb7bcc03c30494acf712625aaac8badc6e7eb16f3453f  nss-pam-ldapd-0.9.8.tar.gz
diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.mk b/package/nss-pam-ldapd/nss-pam-ldapd.mk
index 3eddb5e2a1..c094db96ac 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.mk
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NSS_PAM_LDAPD_VERSION = 0.9.6
+NSS_PAM_LDAPD_VERSION = 0.9.8
 NSS_PAM_LDAPD_SITE = http://arthurdejong.org/nss-pam-ldapd
 NSS_PAM_LDAPD_LICENSE = LGPL-2.1+
 NSS_PAM_LDAPD_LICENSE_FILES = COPYING
-- 
2.11.0
