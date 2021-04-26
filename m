From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 23:00:07 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libqmi: add
 _CPE_ID_VENDOR
Message-ID: <20210426203328.F1F1480E5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf131eb7b0e5b26738cb1da3b0cb73bbbc7d21f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:libqmi_project:libqmi:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:libqmi_project:libqmi

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5793a9e7fd83f9cfa035b3ce97591a92d308efc9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libqmi/libqmi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 5bd2aa1ed4..a49b8615d3 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -9,6 +9,7 @@ LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
+LIBQMI_CPE_ID_VENDOR = libqmi_project
 LIBQMI_INSTALL_STAGING = YES
 
 LIBQMI_DEPENDENCIES = libglib2
