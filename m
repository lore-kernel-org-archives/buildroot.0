From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 20:01:57 +0100
Subject: [Buildroot] [git commit] package/tinydtls: add
 TINYDTLS_CPE_ID_VENDOR
Message-ID: <20210210184152.8309D83976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3880e7d55d22a06b99206514f25e7a91277925bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:eclipse:tinydtls is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aeclipse%3Atinydtls

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinydtls/tinydtls.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinydtls/tinydtls.mk b/package/tinydtls/tinydtls.mk
index b4fd06ff70..6d839bc05a 100644
--- a/package/tinydtls/tinydtls.mk
+++ b/package/tinydtls/tinydtls.mk
@@ -8,6 +8,7 @@ TINYDTLS_VERSION = 0.9-rc1
 TINYDTLS_SITE = $(call github,eclipse,tinydtls,v$(TINYDTLS_VERSION))
 TINYDTLS_LICENSE = EPL-1.0 or EDL-1.0
 TINYDTLS_LICENSE_FILES = LICENSE
+TINYDTLS_CPE_ID_VENDOR = eclipse
 TINYDTLS_INSTALL_STAGING = YES
 TINYDTLS_DEPENDENCIES = host-pkgconf
 # From git
