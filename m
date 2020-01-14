From: Ash Charles <ashcharles@gmail.com>
Date: Mon, 13 Jan 2020 19:58:42 -0500
Subject: [Buildroot] [PATCH 2/2] pru-software-support: bump to latest
 version 5.6.0
In-Reply-To: <20200114005842.45810-1-ashcharles@gmail.com>
References: <20200114005842.45810-1-ashcharles@gmail.com>
Message-ID: <20200114005842.45810-3-ashcharles@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to the latest version of the PRU software support [1]

[1] https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package
---
 package/pru-software-support/pru-software-support.hash | 2 +-
 package/pru-software-support/pru-software-support.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
index f4ce8e466e..f7c2d505a2 100644
--- a/package/pru-software-support/pru-software-support.hash
+++ b/package/pru-software-support/pru-software-support.hash
@@ -1,2 +1,2 @@
 # Locally-calculated hash
-sha256	1e880d74f9a1d04324e6255cb7a0e3d40f92e08809dc81dc6c714447bac5c335	pru-software-support-v5.1.0.tar.gz
+sha256	d6d1f76ab5a50dbdf1dff834b271f9d3ffa7424e4d9615e00713f3f81ed5787e	pru-software-support-package-v5.6.0.tar.gz
diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index d9bcdbf51a..14771f6740 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PRU_SOFTWARE_SUPPORT_VERSION = 5.1.0
-PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/pru-software-support-package/pru-software-support-package/archive-tarball/v$(PRU_SOFTWARE_SUPPORT_VERSION)?
-PRU_SOFTWARE_SUPPORT_SOURCE = $(PRU_SOFTWARE_SUPPORT_NAME)-v$(PRU_SOFTWARE_SUPPORT_VERSION).tar.gz
+PRU_SOFTWARE_SUPPORT_VERSION = 5.6.0
+# https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot/pru-software-support-package-5.6.0.tar.gz
+PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot
+PRU_SOFTWARE_SUPPORT_SOURCE = $(PRU_SOFTWARE_SUPPORT_NAME)-package-v$(PRU_SOFTWARE_SUPPORT_VERSION).tar.gz
 PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3-Clause, GPL-2.0, Public Domain
 PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v5.0-Manifest.html
 PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
-- 
2.24.1
