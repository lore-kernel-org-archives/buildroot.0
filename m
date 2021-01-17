From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 18:52:05 +0100
Subject: [Buildroot] [PATCH 2/5] package/unzip: fix URL of patches
In-Reply-To: <20210117175208.366428-1-fontaine.fabrice@gmail.com>
References: <20210117175208.366428-1-fontaine.fabrice@gmail.com>
Message-ID: <20210117175208.366428-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://sources.debian.org/data/main/u/unzip/6.0-25 is unreachable so
replace it by
https://sources.debian.org/data/main/u/unzip/6.0-26

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/unzip/unzip.mk | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index d435fb6b5d..0fb452a248 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -11,22 +11,22 @@ UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
 
 UNZIP_PATCH = \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/07-increase-size-of-cfactorstr.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/08-allow-greater-hostver-values.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/09-cve-2014-8139-crc-overflow.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/10-cve-2014-8140-test-compr-eb.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/11-cve-2014-8141-getzip64data.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/12-cve-2014-9636-test-compr-eb.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/14-cve-2015-7696.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/15-cve-2015-7697.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/16-fix-integer-underflow-csiz-decrypted.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/17-restore-unix-timestamps-accurately.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/18-cve-2014-9913-unzip-buffer-overflow.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/19-cve-2016-9844-zipinfo-buffer-overflow.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/20-cve-2018-1000035-unzip-buffer-overflow.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/21-fix-warning-messages-on-big-files.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/22-cve-2019-13232-fix-bug-in-undefer-input.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/23-cve-2019-13232-zip-bomb-with-overlapped-entries.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/24-cve-2019-13232-do-not-raise-alert-for-misplaced-central-directory.patch
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/07-increase-size-of-cfactorstr.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/08-allow-greater-hostver-values.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/09-cve-2014-8139-crc-overflow.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/10-cve-2014-8140-test-compr-eb.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/11-cve-2014-8141-getzip64data.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/12-cve-2014-9636-test-compr-eb.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/14-cve-2015-7696.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/15-cve-2015-7697.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/16-fix-integer-underflow-csiz-decrypted.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/17-restore-unix-timestamps-accurately.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/18-cve-2014-9913-unzip-buffer-overflow.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/19-cve-2016-9844-zipinfo-buffer-overflow.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/20-cve-2018-1000035-unzip-buffer-overflow.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/21-fix-warning-messages-on-big-files.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/22-cve-2019-13232-fix-bug-in-undefer-input.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/23-cve-2019-13232-zip-bomb-with-overlapped-entries.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/24-cve-2019-13232-do-not-raise-alert-for-misplaced-central-directory.patch
 
 $(eval $(cmake-package))
-- 
2.29.2
