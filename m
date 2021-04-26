From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 15:12:25 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/pkgconf: add
 _CPE_ID_VENDOR
Message-ID: <20210426125913.2692E817A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83d190eefde34cf94ca93f151ec326dcf2b253e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:pkgconf:pkgconf:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:pkgconf:pkgconf

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2680b7dfea9ea53ba105ba47d224c5f016fe5cb0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkgconf/pkgconf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 3d51258d65..5d65f69c10 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -9,6 +9,7 @@ PKGCONF_SITE = https://distfiles.dereferenced.org/pkgconf
 PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.xz
 PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
+PKGCONF_CPE_ID_VENDOR = pkgconf
 
 PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/bin/pkg-config
 
