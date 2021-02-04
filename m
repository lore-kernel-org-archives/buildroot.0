From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2021 18:17:28 +0100
Subject: [Buildroot] [git commit] package/squashfs: set SQUASHFS_CPE_ID_VALID
Message-ID: <20210204170218.E1A3F811D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02200de4b83879b1932e80e1867fa0c1d3eda1eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:squashfs_project:squashfs is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asquashfs_project%3Asquashfs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squashfs/squashfs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 15707e198e..026c0a46cc 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -8,6 +8,7 @@ SQUASHFS_VERSION = 4.4
 SQUASHFS_SITE = $(call github,plougher,squashfs-tools,$(SQUASHFS_VERSION))
 SQUASHFS_LICENSE = GPL-2.0+
 SQUASHFS_LICENSE_FILES = COPYING
+SQUASHFS_CPE_ID_VALID = YES
 SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1
 
 ifeq ($(BR2_PACKAGE_SQUASHFS_LZ4),y)
