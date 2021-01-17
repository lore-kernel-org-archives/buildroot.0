From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 16:50:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgit2: add LIBGIT2_CPE_ID_VENDOR
Message-ID: <20210117155057.350123-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libgit2:libgit2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibgit2%3Alibgit2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgit2/libgit2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 30e6f24887..14709a0939 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -8,6 +8,7 @@ LIBGIT2_VERSION = 1.1.0
 LIBGIT2_SITE = https://github.com/libgit2/libgit2/releases/download/v$(LIBGIT2_VERSION)
 LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch)
 LIBGIT2_LICENSE_FILES = COPYING
+LIBGIT2_CPE_ID_VALID = YES
 LIBGIT2_INSTALL_STAGING = YES
 
 LIBGIT2_CONF_OPTS = \
-- 
2.29.2
