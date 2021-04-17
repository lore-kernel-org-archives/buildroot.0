From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Apr 2021 08:58:43 +0200
Subject: [Buildroot] [git commit] package/libcgroup: add
 LIBCGROUP_CPE_ID_VENDOR
Message-ID: <20210417063245.2E8C57F980@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6333d5d1dcbe6d8a40ab371c7eff596bf3ac44f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libcgroup_project:libcgroup is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibcgroup_project%3Alibcgroup

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcgroup/libcgroup.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index ff0639946c..156b066162 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -9,6 +9,7 @@ LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
 LIBCGROUP_SITE = https://github.com/libcgroup/libcgroup/releases/download/v$(LIBCGROUP_VERSION)
 LIBCGROUP_LICENSE = LGPL-2.1
 LIBCGROUP_LICENSE_FILES = COPYING
+LIBCGROUP_CPE_ID_VENDOR = libcgroup_project
 LIBCGROUP_DEPENDENCIES = host-bison host-flex
 LIBCGROUP_INSTALL_STAGING = YES
 
