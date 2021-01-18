From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 21:49:13 +0100
Subject: [Buildroot] [git commit] package/exim: add EXIM_CPE_ID_VENDOR
Message-ID: <20210118203943.B52DE818AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c18d2133f7872717a6e704b0696713ee52e731ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:exim:exim is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aexim%3Aexim

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exim/exim.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 19a62f497d..53185c4bb8 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -9,6 +9,7 @@ EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
 EXIM_LICENSE_FILES = LICENCE
+EXIM_CPE_ID_VENDOR = exim
 EXIM_DEPENDENCIES = host-berkeleydb host-pcre pcre berkeleydb host-pkgconf
 
 # Modify a variable value. It must already exist in the file, either
