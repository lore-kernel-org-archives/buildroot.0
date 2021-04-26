From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 15:18:09 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/sysvinit: add
 _CPE_ID_VENDOR
Message-ID: <20210426125913.8BCE38138F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1784aa80ebe80a2c3d81e94f2181f3189c253c4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:sysvinit_project:sysvinit:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:sysvinit_project:sysvinit

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 281f0d90cb7bea94cdcc60990983a76b81e8b5bf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysvinit/sysvinit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index c7ddf67c2f..7deec96974 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -9,6 +9,7 @@ SYSVINIT_SOURCE = sysvinit-$(SYSVINIT_VERSION).tar.xz
 SYSVINIT_SITE = http://download.savannah.nongnu.org/releases/sysvinit
 SYSVINIT_LICENSE = GPL-2.0+
 SYSVINIT_LICENSE_FILES = COPYING
+SYSVINIT_CPE_ID_VENDOR = sysvinit_project
 
 SYSVINIT_MAKE_OPTS = SYSROOT=$(STAGING_DIR)
 
