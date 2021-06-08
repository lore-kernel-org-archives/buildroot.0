From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jun 2021 08:10:41 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/blktrace: add
 BLKTRACE_CPE_ID_VENDOR
Message-ID: <20210608064256.D3CEF8C56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbd9d87261b3fcdc8c7f4901bf791abc5b1e93cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:blktrace_project:blktrace is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ablktrace_project%3Ablktrace

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b3c332853eb6aeec627f53c8cef7658c3cf304f6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/blktrace/blktrace.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/blktrace/blktrace.mk b/package/blktrace/blktrace.mk
index 4ada2e8e4b..1a5f59bcce 100644
--- a/package/blktrace/blktrace.mk
+++ b/package/blktrace/blktrace.mk
@@ -9,6 +9,7 @@ BLKTRACE_SITE = http://brick.kernel.dk/snaps
 BLKTRACE_DEPENDENCIES = libaio
 BLKTRACE_LICENSE = GPL-2.0+
 BLKTRACE_LICENSE_FILES = COPYING
+BLKTRACE_CPE_ID_VENDOR = blktrace_project
 
 # 0001-btt-make-device-devno-use-PATH_MAX-to-avoid-overflow.patch
 BLKTRACE_IGNORE_CVES += CVE-2018-10689
