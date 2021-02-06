From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Feb 2021 17:11:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/slirp: add CPE variables
Message-ID: <20210206161122.2005770-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libslirp_project:libslirp is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibslirp_project%3Alibslirp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/slirp/slirp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index 33c568c058..ff92c60517 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -11,6 +11,8 @@ SLIRP_SOURCE = libslirp-$(SLIRP_VERSION).tar.xz
 SLIRP_SITE = https://elmarco.fedorapeople.org
 SLIRP_LICENSE = BSD-3-Clause
 SLIRP_LICENSE_FILES = COPYRIGHT
+SLIRP_CPE_ID_VENDOR = libslirp_project
+SLIRP_CPE_ID_PRODUCT = libslirp
 SLIRP_INSTALL_STAGING = YES
 SLIRP_DEPENDENCIES = libglib2
 
-- 
2.29.2
