From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Feb 2021 13:47:17 +0100
Subject: [Buildroot] [git commit] package/libtirpc: set LIBTIRPC_CPE_ID_VALID
Message-ID: <20210205122651.BA0B283C5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56423580224528fda81b3b866b76bde3a95d4161
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libtirpc_project:libtirpc is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibtirpc_project%3Alibtirpc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtirpc/libtirpc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 5371d20488..e0c3d0e3f2 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -9,6 +9,7 @@ LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
 LIBTIRPC_LICENSE_FILES = COPYING
+LIBTIRPC_CPE_ID_VALID = YES
 
 LIBTIRPC_DEPENDENCIES = host-nfs-utils
 LIBTIRPC_INSTALL_STAGING = YES
