From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  5 Apr 2020 00:13:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/mcrypt: annotate CVEs
Message-ID: <20200404221325.1543421-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mcrypt/mcrypt.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mcrypt/mcrypt.mk b/package/mcrypt/mcrypt.mk
index f98895f401..a04b973750 100644
--- a/package/mcrypt/mcrypt.mk
+++ b/package/mcrypt/mcrypt.mk
@@ -14,4 +14,11 @@ MCRYPT_CONF_OPTS = --with-libmcrypt-prefix=$(STAGING_DIR)/usr
 MCRYPT_LICENSE = GPL-3.0
 MCRYPT_LICENSE_FILES = COPYING
 
+# 0001-CVE-2012-4409.patch
+MCRYPT_IGNORE_CVES += CVE-2012-4409
+# 0002-CVE-2012-4426.patch
+MCRYPT_IGNORE_CVES += CVE-2012-4426
+# 0003-CVE-2012-4527.patch
+MCRYPT_IGNORE_CVES += CVE-2012-4527
+
 $(eval $(autotools-package))
-- 
2.25.1
