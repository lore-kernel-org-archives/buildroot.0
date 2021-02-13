From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Feb 2021 22:27:46 +0100
Subject: [Buildroot] [git commit] package/fail2ban: add
 FAIL2BAN_CPE_ID_VENDOR
Message-ID: <20210213210640.27E5383E54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c9f01aff8f84deaf09560779e6c29d13e0efb54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:fail2ban:fail2ban is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afail2ban%3Afail2ban

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fail2ban/fail2ban.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index a4ee0852cc..d2fe19d11e 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -8,6 +8,7 @@ FAIL2BAN_VERSION = 0.11.1
 FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
 FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
+FAIL2BAN_CPE_ID_VENDOR = fail2ban
 FAIL2BAN_SETUP_TYPE = distutils
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
