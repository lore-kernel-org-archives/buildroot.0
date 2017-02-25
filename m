From: camden.mannett at gmail.com <camden.mannett@gmail.com>
Date: Sat, 25 Feb 2017 11:43:21 +0000
Subject: [Buildroot] [PATCHv3 1/1] pru-software-support: bump version to
	5.1.0
Message-ID: <20170225114321.5844-1-camden.mannett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Cam Mannett <camden.mannett@gmail.com>

Third time lucky.

Signed-off-by: Cam Mannett <camden.mannett@gmail.com>
---
 package/pru-software-support/pru-software-support.hash | 2 +-
 package/pru-software-support/pru-software-support.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
index 8f624da..f4ce8e4 100644
--- a/package/pru-software-support/pru-software-support.hash
+++ b/package/pru-software-support/pru-software-support.hash
@@ -1,2 +1,2 @@
 # Locally-calculated hash
-sha256	b257535ca9b1641d1a238795f3c7004064c573a91cf4a1fa566e3f7c2360c38f	pru-software-support-804b548e69ef9fdf44445f6d0968d81cb8a1e7b4.tar.gz
+sha256	1e880d74f9a1d04324e6255cb7a0e3d40f92e08809dc81dc6c714447bac5c335	pru-software-support-v5.1.0.tar.gz
diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index 06983c2..adaa4ac 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PRU_SOFTWARE_SUPPORT_VERSION = 804b548e69ef9fdf44445f6d0968d81cb8a1e7b4
-PRU_SOFTWARE_SUPPORT_SITE = git://git.ti.com/pru-software-support-package/pru-software-support-package.git
+PRU_SOFTWARE_SUPPORT_VERSION = v5.1.0
+PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/pru-software-support-package/pru-software-support-package/archive-tarball/$(PRU_SOFTWARE_SUPPORT_VERSION)?
 PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3c, GPLv2, Public Domain
-PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v4.0-Manifest.html
+PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v5.0-Manifest.html
 PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
 HOST_PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru
 
-- 
2.9.3
