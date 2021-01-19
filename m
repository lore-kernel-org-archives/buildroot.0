From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Jan 2021 23:31:09 +0100
Subject: [Buildroot] [PATCH 2/2] package/sysklogd: set SYSKLOGD_CPE_ID_VALID
In-Reply-To: <20210119223109.1168744-1-fontaine.fabrice@gmail.com>
References: <20210119223109.1168744-1-fontaine.fabrice@gmail.com>
Message-ID: <20210119223109.1168744-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:sysklogd_project:sysklogd is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asysklogd_project%3Asysklogd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sysklogd/sysklogd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index cd013f658c..200738897d 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -8,6 +8,7 @@ SYSKLOGD_VERSION = 2.1.2
 SYSKLOGD_SITE = $(call github,troglobit,sysklogd,v$(SYSKLOGD_VERSION))
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
+SYSKLOGD_CPE_ID_VALID = YES
 # From git
 SYSKLOGD_AUTORECONF = YES
 SYSKLOGD_CONF_OPTS = --exec-prefix=/ --without-logger
-- 
2.29.2
