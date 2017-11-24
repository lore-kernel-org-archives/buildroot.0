From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 09:13:52 +0100
Subject: [Buildroot] [git commit] dovecot: add applicable licenses
Message-ID: <20171124082923.BDC2E80298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f452ffbf758f9f4cba4eb7bcae42c07878d5857
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

List all code licenses mentioned in COPYING.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dovecot/dovecot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 4cc6ae4..fa69acf 100644
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
