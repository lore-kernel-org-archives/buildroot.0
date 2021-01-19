From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Jan 2021 19:11:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/rhash: set RHASH_CPE_ID_VALID
Message-ID: <20210119181125.499761-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:rhash_project:rhash is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Arhash_project%3Arhash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rhash/rhash.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 1682676dac..4438112f3f 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -9,6 +9,7 @@ RHASH_SOURCE = rhash-$(RHASH_VERSION)-src.tar.gz
 RHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(RHASH_VERSION)
 RHASH_LICENSE = 0BSD
 RHASH_LICENSE_FILES = COPYING
+RHASH_CPE_ID_VALID = YES
 RHASH_INSTALL_STAGING = YES
 RHASH_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 RHASH_ADDLDFLAGS = $(TARGET_NLS_LIBS)
-- 
2.29.2
