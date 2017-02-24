From: Cam Mannett <camden.mannett@protonmail.ch>
Date: Fri, 24 Feb 2017 11:36:00 -0500
Subject: [Buildroot] [PATCH 1/2] pru-software-support: bump version to v5.1.0
Message-ID: <v876CxL3ex-BtugJbekKoJbWXsHAngjnGCZdxMw6pmIrZrJdYmCOp5gWgjmDazOIanKjZhCok9Zp5GHyXXCWYD_ZfU89WjpVHISmaVUnD60=@protonmail.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Camden Mannett <camden.mannett@protonmail.ch>
---
package/pru-software-support/pru-software-support.hash | 2 --
package/pru-software-support/pru-software-support.mk | 4 ++--
2 files changed, 2 insertions(+), 4 deletions(-)
delete mode 100644 package/pru-software-support/pru-software-support.hash

diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
deleted file mode 100644
index 8f624da..0000000
--- a/package/pru-software-support/pru-software-support.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally-calculated hash
-sha256 b257535ca9b1641d1a238795f3c7004064c573a91cf4a1fa566e3f7c2360c38f pru-software-support-804b548e69ef9fdf44445f6d0968d81cb8a1e7b4.tar.gz
diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index 06983c2..412abdb 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -4,10 +4,10 @@
#
################################################################################

-PRU_SOFTWARE_SUPPORT_VERSION = 804b548e69ef9fdf44445f6d0968d81cb8a1e7b4
+PRU_SOFTWARE_SUPPORT_VERSION = v5.1.0
PRU_SOFTWARE_SUPPORT_SITE = git://git.ti.com/pru-software-support-package/pru-software-support-package.git
PRU_SOFTWARE_SUPPORT_LICENSE = BSD-3c, GPLv2, Public Domain
-PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v4.0-Manifest.html
+PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v5.0-Manifest.html
PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
HOST_PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru

--
2.9.3
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170224/e3341ca5/attachment.html>
