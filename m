From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 19:50:50 +0100
Subject: [Buildroot] [git commit] package/trousers: add
 TROUSERS_CPE_ID_VENDOR
Message-ID: <20210126183304.A1E8780367@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c6961b9871949bca6f073b6ebef80d07415819c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:trustedcomputinggroup:trousers is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atrustedcomputinggroup%3Atrousers

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/trousers/trousers.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/trousers/trousers.mk b/package/trousers/trousers.mk
index b2cfef0968..b84425dea4 100644
--- a/package/trousers/trousers.mk
+++ b/package/trousers/trousers.mk
@@ -8,6 +8,7 @@ TROUSERS_VERSION = 0.3.15
 TROUSERS_SITE = http://downloads.sourceforge.net/project/trousers/trousers/$(TROUSERS_VERSION)
 TROUSERS_LICENSE = BSD-3-Clause
 TROUSERS_LICENSE_FILES = LICENSE
+TROUSERS_CPE_ID_VENDOR = trustedcomputinggroup
 TROUSERS_INSTALL_STAGING = YES
 # Need autoreconf because of a patch touching configure.in and Makefile.am
 TROUSERS_AUTORECONF = YES
