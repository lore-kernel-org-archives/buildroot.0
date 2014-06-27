From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Jun 2014 10:17:50 -0300
Subject: [Buildroot] [PATCH] php: security bump to version 5.5.14
Message-ID: <1403875070-601-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

CVE-2014-3981 - insecure temporary file use in the configure script.
CVE-2014-0207 - cdf_read_short_sector insufficient boundary check.
CVE-2014-3478 - mconvert incorrect handling of truncated pascal string
size.
CVE-2014-3479 - cdf_check_stream_offset insufficient boundary check.
CVE-2014-3480 - cdf_count_chain insufficient boundary check.
CVE-2014-3487 - cdf_read_property_info insufficient boundary check.
CVE-2014-4049 - Fix potential segfault in dns_get_record().
CVE-2014-3515 - unserialize() SPL ArrayObject / SPLObjectStorage Type
Confusion.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index a878800..8ac5d86 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.13
+PHP_VERSION = 5.5.14
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
-- 
1.8.5.5
