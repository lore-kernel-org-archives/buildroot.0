From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jun 2021 09:08:23 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libnids: add
 LIBNIDS_CPE_ID_VENDOR
Message-ID: <20210608064257.242D4886B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce067a47105dfadbd3421cabb10494647ae55dbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:libnids_project:libnids is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibnids_project%3Alibnids

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3ab5ec3fbcb05c6272ace6976e95155060202585)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnids/libnids.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
index fb3df318b4..4a9138b80e 100644
--- a/package/libnids/libnids.mk
+++ b/package/libnids/libnids.mk
@@ -8,6 +8,7 @@ LIBNIDS_VERSION = 1.24
 LIBNIDS_SITE = https://sourceforge.net/projects/libnids/files/libnids/$(LIBNIDS_VERSION)
 LIBNIDS_LICENSE = GPL-2.0
 LIBNIDS_LICENSE_FILES = COPYING
+LIBNIDS_CPE_ID_VENDOR = libnids_project
 LIBNIDS_INSTALL_STAGING = YES
 LIBNIDS_DEPENDENCIES = host-pkgconf libpcap
 LIBNIDS_AUTORECONF = YES
