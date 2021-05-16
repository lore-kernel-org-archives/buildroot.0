From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 18:30:44 +0200
Subject: [Buildroot] [git commit] package/tclap: add TCLAP_CPE_ID_VENDOR
Message-ID: <20210516161235.CE04186BDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ffd14f28a23c13f8daa0b6f538bd0fc8a1c3d30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:tclap_project:tclap is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atclap_project%3Atclap

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tclap/tclap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tclap/tclap.mk b/package/tclap/tclap.mk
index 63dea67ac4..e1856420f3 100644
--- a/package/tclap/tclap.mk
+++ b/package/tclap/tclap.mk
@@ -9,6 +9,7 @@ TCLAP_SITE = http://downloads.sourceforge.net/project/tclap
 TCLAP_LICENSE = MIT
 TCLAP_LICENSE_FILES = COPYING
 TCLAP_INSTALL_STAGING = YES
+TCLAP_CPE_ID_VENDOR = tclap_project
 
 # This package is a pure C++ template library, only made of headers.
 TCLAP_INSTALL_TARGET = NO
