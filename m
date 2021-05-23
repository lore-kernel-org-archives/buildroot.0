From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 19:49:53 +0200
Subject: [Buildroot] [git commit] package/minissdpd: add
 MINISSDPD_CPE_ID_VENDOR
Message-ID: <20210523172850.AD25988F9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84c07e1f51a0305995c6b956bc91a7f1a78746ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:miniupnp_project:minissdpd is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aminiupnp_project%3Aminissdpd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/minissdpd/minissdpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/minissdpd/minissdpd.mk b/package/minissdpd/minissdpd.mk
index 4560919baa..214af76387 100644
--- a/package/minissdpd/minissdpd.mk
+++ b/package/minissdpd/minissdpd.mk
@@ -8,6 +8,7 @@ MINISSDPD_VERSION = 1.5.20200928
 MINISSDPD_SITE = http://miniupnp.free.fr/files
 MINISSDPD_LICENSE = BSD-3-Clause
 MINISSDPD_LICENSE_FILES = LICENSE
+MINISSDPD_CPE_ID_VENDOR = miniupnp_project
 MINISSDPD_DEPENDENCIES = libnfnetlink
 
 define MINISSDPD_BUILD_CMDS
