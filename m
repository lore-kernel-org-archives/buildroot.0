From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 23:23:13 +0200
Subject: [Buildroot] [git commit] package/popt: add _CPE_ID_VENDOR
Message-ID: <20210420205903.6F2B5812AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba18dc36a467d504ed2d9affd0cf6b41c7deb997
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:popt_project:popt:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:popt_project:popt

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998 at free.fr: move up, right after license]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/popt/popt.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 5c4863ce40..f00bf115ee 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -9,6 +9,8 @@ POPT_SITE = http://ftp.rpm.org/popt/releases/popt-1.x
 POPT_INSTALL_STAGING = YES
 POPT_LICENSE = MIT
 POPT_LICENSE_FILES = COPYING
+POPT_CPE_ID_VENDOR = popt_project
+
 POPT_GETTEXTIZE = YES
 POPT_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 # We're patching configure.ac
