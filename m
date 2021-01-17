From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 18:13:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/syslog-ng: add
 SYSLOG_NG_CPE_ID_VENDOR
Message-ID: <20210117171312.356255-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:oneidentity:syslog-ng is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aoneidentity%3Asyslog-ng

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/syslog-ng/syslog-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index b6b5fad7da..6d22883116 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -10,6 +10,7 @@ SYSLOG_NG_VERSION = 3.30.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
+SYSLOG_NG_CPE_ID_VENDOR = oneidentity
 SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	libglib2 openssl pcre
 # We're patching configure.ac
-- 
2.29.2
