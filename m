From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 11:39:05 +0100
Subject: [Buildroot] [git commit] package/spice: set SPICE_CPE_ID_VALID
Message-ID: <20210130102238.704DA81414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea238f53ebc713c98b94d0c31d5019de0753a292
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:spice_project:spice is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aspice_project%3Aspice

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spice/spice.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 78d397bdc0..db05bd67f0 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -9,6 +9,7 @@ SPICE_SOURCE = spice-$(SPICE_VERSION).tar.bz2
 SPICE_SITE = http://www.spice-space.org/download/releases/spice-server
 SPICE_LICENSE = LGPL-2.1+
 SPICE_LICENSE_FILES = COPYING
+SPICE_CPE_ID_VALID = YES
 SPICE_INSTALL_STAGING = YES
 SPICE_DEPENDENCIES = \
 	host-pkgconf \
