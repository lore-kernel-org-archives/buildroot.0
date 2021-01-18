From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 21:49:15 +0100
Subject: [Buildroot] [git commit] package/thttpd: add THTTPD_CPE_ID_VENDOR
Message-ID: <20210118203943.BE94388530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b19cf61a87e3e24e8636751f513a82343a6395a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:acme:thttpd is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aacme%3Athttpd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/thttpd/thttpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index fe96f7df65..3815705b58 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -8,6 +8,7 @@ THTTPD_VERSION = 2.29
 THTTPD_SITE = https://acme.com/software/thttpd
 THTTPD_LICENSE = BSD-2-Clause
 THTTPD_LICENSE_FILES = thttpd.c
+THTTPD_CPE_ID_VENDOR = acme
 
 THTTPD_MAKE = $(MAKE1)
 
