From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:30:16 +0100
Subject: [Buildroot] [git commit] package/unzip: set UNZIP_CPE_ID_VALID
Message-ID: <20210118211111.CBCCA884D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a8e039a0e9624b6d75e36df6c9ee51e93e1a254
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:unzip_project:unzip is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aunzip_project%3Aunzip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unzip/unzip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index d435fb6b5d..231abc86be 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -9,6 +9,7 @@ UNZIP_SOURCE = unzip$(subst .,,$(UNZIP_VERSION)).tgz
 UNZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
 UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
+UNZIP_CPE_ID_VALID = YES
 
 UNZIP_PATCH = \
 	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/07-increase-size-of-cfactorstr.patch \
