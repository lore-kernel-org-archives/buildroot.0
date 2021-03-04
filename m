From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Mar 2021 08:13:49 +0100
Subject: [Buildroot] [git commit] package/librsync: set LIBRSYNC_CPE_ID_VALID
Message-ID: <20210304065255.31BA786AA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a6ea830a7b2aa6b15256fd701836036be0a4f2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:librsync_project:librsync is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibrsync_project%3Alibrsync

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/librsync/librsync.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index fbe56d4a28..fd9eefe129 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -8,6 +8,7 @@ LIBRSYNC_VERSION = 2.3.1
 LIBRSYNC_SITE = $(call github,librsync,librsync,v$(LIBRSYNC_VERSION))
 LIBRSYNC_LICENSE = LGPL-2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
+LIBRSYNC_CPE_ID_VALID = YES
 LIBRSYNC_INSTALL_STAGING = YES
 LIBRSYNC_DEPENDENCIES = host-pkgconf zlib bzip2 popt
 
