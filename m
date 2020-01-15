From: Ash Charles <ashcharles@gmail.com>
Date: Tue, 14 Jan 2020 21:17:08 -0500
Subject: [Buildroot] [PATCH v2 2/3] pru-software-support: bump to latest
 version 5.6.0
In-Reply-To: <20200115021709.64647-1-ashcharles@gmail.com>
References: <20200114005842.45810-2-ashcharles@gmail.com>
 <20200115021709.64647-1-ashcharles@gmail.com>
Message-ID: <20200115021709.64647-3-ashcharles@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to the latest version of the PRU software support [1]

Formatting for the license file has been updated compared with the
previous package version 5.1.0 but the licenses used appear the same.

[1] https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 package/pru-software-support/pru-software-support.hash | 2 +-
 package/pru-software-support/pru-software-support.mk   | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
index f4ce8e466e..f7c2d505a2 100644
--- a/package/pru-software-support/pru-software-support.hash
+++ b/package/pru-software-support/pru-software-support.hash
@@ -1,2 +1,2 @@
 # Locally-calculated hash
-sha256	1e880d74f9a1d04324e6255cb7a0e3d40f92e08809dc81dc6c714447bac5c335	pru-software-support-v5.1.0.tar.gz
+sha256	d6d1f76ab5a50dbdf1dff834b271f9d3ffa7424e4d9615e00713f3f81ed5787e	pru-software-support-package-v5.6.0.tar.gz
diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index d9bcdbf51a..b56ac0af12 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -4,11 +4,12 @@
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
-PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v5.0-Manifest.html
+PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v6.0-Manifest.html
 PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
 HOST_PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru
 
-- 
2.24.1
