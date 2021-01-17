From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 19:30:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/strace: set STRACE_CPE_ID_VALID
Message-ID: <20210117183018.369264-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:strace_project:strace is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Astrace_project%3Astrace

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/strace/strace.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 6ec3c2c068..646be41e5b 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -9,6 +9,7 @@ STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
 STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
+STRACE_CPE_ID_VALID = YES
 STRACE_CONF_OPTS = --enable-mpers=no
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
-- 
2.29.2
