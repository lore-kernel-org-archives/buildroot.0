From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 14:58:52 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/automake: add
 _CPE_ID_VENDOR
Message-ID: <20210426125912.6C66D7FC74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d023df01d4681b0d2420eafe57cebd1b2afad1ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:gnu:automake:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Aautomake

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2de8724d54ab2b95cb4033f28e54a5af1b5aff7c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/automake/automake.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 89dcaa1293..ad8f0f474d 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -9,6 +9,7 @@ AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 AUTOMAKE_LICENSE = GPL-2.0+
 AUTOMAKE_LICENSE_FILES = COPYING
+AUTOMAKE_CPE_ID_VENDOR = gnu
 
 HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 
