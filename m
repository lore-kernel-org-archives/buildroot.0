From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Mar 2021 12:34:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: set HARFBUZZ_CPE_ID_VALID
Message-ID: <20210304113454.1236366-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:harfbuzz_project:harfbuzz is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aharfbuzz_project%3Aharfbuzz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.30.0
