From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 23:23:13 +0200
Subject: [Buildroot] [git commit] package/openresolv: add _CPE_ID_VENDOR
Message-ID: <20210420205903.50DBE815BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=444d71e123e13c7102bfe3d38552c439b4a3e3b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:openresolv_project:openresolv:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:openresolv_project:openresolv

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openresolv/openresolv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openresolv/openresolv.mk b/package/openresolv/openresolv.mk
index 44e0720428..55ec7fd8f9 100644
--- a/package/openresolv/openresolv.mk
+++ b/package/openresolv/openresolv.mk
@@ -8,6 +8,7 @@ OPENRESOLV_VERSION = 3.10.0
 OPENRESOLV_SITE = $(call github,rsmarples,openresolv,openresolv-$(OPENRESOLV_VERSION))
 OPENRESOLV_LICENSE = BSD-2-Clause
 OPENRESOLV_LICENSE_FILES = LICENSE
+OPENRESOLV_CPE_ID_VENDOR = openresolv_project
 
 define OPENRESOLV_CONFIGURE_CMDS
 	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure --sysconfdir=/etc
