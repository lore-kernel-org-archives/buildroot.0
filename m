From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 16:30:36 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/mcrypt: annotate
 CVEs
Message-ID: <20200408141858.99CC180070@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d9ebbb158cc068f66b38f4599072c2b9143cc3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cdfa84a80d204b2ac0c28103606c2dc4f8bb2f10)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
