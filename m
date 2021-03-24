From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 14:07:17 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/dhcpcd: add
 DHCPCD_CPE_ID_VENDOR
Message-ID: <20210324133906.73981890A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=171211a38bccfca3e5163b417b32973fcb08003d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:dhcpcd_project:dhcpcd is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adhcpcd_project%3Adhcpcd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b844bf46ba521397e5d19de77a2c55e85514ac21)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index f040610de4..1af019fd9e 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -10,6 +10,7 @@ DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
 DHCPCD_LICENSE = BSD-2-Clause
 DHCPCD_LICENSE_FILES = LICENSE
+DHCPCD_CPE_ID_VENDOR = dhcpcd_project
 
 DHCPCD_CONFIG_OPTS = \
 	--libexecdir=/lib/dhcpcd \
