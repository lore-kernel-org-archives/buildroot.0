From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Jan 2021 22:24:41 +0100
Subject: [Buildroot] [git commit] package/sysklogd: set SYSKLOGD_CPE_ID_VALID
Message-ID: <20210121210526.CE3D488F1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6b567941b1ab934679c4b38c1316b36aadc2110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:sysklogd_project:sysklogd is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asysklogd_project%3Asysklogd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysklogd/sysklogd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index cd013f658c..200738897d 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -8,6 +8,7 @@ SYSKLOGD_VERSION = 2.1.2
 SYSKLOGD_SITE = $(call github,troglobit,sysklogd,v$(SYSKLOGD_VERSION))
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
+SYSKLOGD_CPE_ID_VALID = YES
 # From git
 SYSKLOGD_AUTORECONF = YES
 SYSKLOGD_CONF_OPTS = --exec-prefix=/ --without-logger
