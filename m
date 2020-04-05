From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Apr 2020 16:25:43 +0200
Subject: [Buildroot] [git commit] package/mcrypt: annotate CVEs
Message-ID: <20200405141204.958BC84BFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdfa84a80d204b2ac0c28103606c2dc4f8bb2f10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
