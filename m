From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Mar 2021 19:53:43 +0100
Subject: [Buildroot] [git commit] package/harfbuzz: set HARFBUZZ_CPE_ID_VALID
Message-ID: <20210304183428.E65EB8145B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93e94bde2d21d1b42530c65a6017a1c6f8ccc50a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:harfbuzz_project:harfbuzz is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aharfbuzz_project%3Aharfbuzz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/harfbuzz/harfbuzz.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index a17283bea9..28771118a1 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -9,6 +9,7 @@ HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZ
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
 HARFBUZZ_LICENSE_FILES = COPYING
+HARFBUZZ_CPE_ID_VALID = YES
 HARFBUZZ_INSTALL_STAGING = YES
 HARFBUZZ_CONF_OPTS = \
 	-Dfontconfig=disabled \
