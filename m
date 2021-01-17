From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 16:31:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/polkit: set POLKIT_CPE_ID_VALID
Message-ID: <20210117153141.348438-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:polkit_project:polkit is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apolkit_project%3Apolkit

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/polkit/polkit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 3ae42b2312..e3fad53183 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -8,6 +8,7 @@ POLKIT_VERSION = 0.116
 POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
+POLKIT_CPE_ID_VALID = YES
 POLKIT_AUTORECONF = YES
 POLKIT_INSTALL_STAGING = YES
 
-- 
2.29.2
