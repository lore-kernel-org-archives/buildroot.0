From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 21:56:49 +0100
Subject: [Buildroot] [git commit] package/lftp: set LFTP_CPE_ID_VALID
Message-ID: <20210116203845.E262387A3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d6d3811b53c59de6025ea1de029a4d88303baee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:lftp_project:lftp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alftp_project%3Alftp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lftp/lftp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 1348e137de..483ca298cd 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -9,6 +9,7 @@ LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPL-3.0+
 LFTP_LICENSE_FILES = COPYING
+LFTP_CPE_ID_VALID = YES
 LFTP_DEPENDENCIES = readline zlib host-pkgconf
 
 # Help lftp finding readline and zlib
