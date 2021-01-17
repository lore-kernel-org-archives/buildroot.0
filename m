From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 18:52:08 +0100
Subject: [Buildroot] [PATCH 5/5] package/unzip: set UNZIP_CPE_ID_VALID
In-Reply-To: <20210117175208.366428-1-fontaine.fabrice@gmail.com>
References: <20210117175208.366428-1-fontaine.fabrice@gmail.com>
Message-ID: <20210117175208.366428-5-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:unzip_project:unzip is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aunzip_project%3Aunzip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/unzip/unzip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 9eff5e0639..e96a109c2e 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -9,6 +9,7 @@ UNZIP_SOURCE = unzip$(subst .,,$(UNZIP_VERSION)).tgz
 UNZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
 UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
+UNZIP_CPE_ID_VALID = YES
 
 UNZIP_PATCH = \
 	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/07-increase-size-of-cfactorstr.patch \
-- 
2.29.2
