From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 21:51:06 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libldns: add CPE
 variables
Message-ID: <20210519192209.E594088773@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00f7f922c06e34842bd8bfe92ab5d9b81fd7789f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:nlnetlabs:ldns is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anlnetlabs%3Aldns

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c2bc364c083407c598cb3a40de125cc079c28a60)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libldns/libldns.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 75159389de..9c248bbc19 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -9,6 +9,8 @@ LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
 LIBLDNS_SITE = http://www.nlnetlabs.nl/downloads/ldns
 LIBLDNS_LICENSE = BSD-3-Clause
 LIBLDNS_LICENSE_FILES = LICENSE
+LIBLDNS_CPE_ID_VENDOR = nlnetlabs
+LIBLDNS_CPE_ID_PRODUCT = ldns
 LIBLDNS_INSTALL_STAGING = YES
 LIBLDNS_DEPENDENCIES = openssl
 # --disable-dane-verify can be removed after openssl bump to 1.1.x
