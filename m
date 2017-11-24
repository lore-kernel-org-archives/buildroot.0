From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 24 Nov 2017 06:58:56 +0200
Subject: [Buildroot] [PATCH] dovecot: add applicable licenses
Message-ID: <371da0b6a8bc2220bc02c4c27db2e45f26e635cf.1511499536.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

List all code licenses mentioned in COPYING.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dovecot/dovecot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 4cc6ae4de701..fa69acfa2095 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -8,7 +8,7 @@ DOVECOT_VERSION_MAJOR = 2.2
 DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).31
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
-DOVECOT_LICENSE = LGPL-2.1
+DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
 DOVECOT_LICENSE_FILES = COPYING COPYING.LGPL COPYING.MIT
 DOVECOT_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.15.0
