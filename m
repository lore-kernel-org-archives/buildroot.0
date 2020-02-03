From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 22:15:22 +0100
Subject: [Buildroot] [git commit] pru-software-support: bump to latest
 version 5.6.0
Message-ID: <20200203210423.3E1F988F5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4698b15a53dcced281d054cf23f9310fd7a9501
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to the latest version of the PRU software support.

Formatting for the license file has been updated compared with the
previous package version 5.1.0 but the licenses used appear the same.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
[yann.morin.1998 at free.fr: fold the license hash patch into this patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pru-software-support/pru-software-support.hash | 4 ++--
 package/pru-software-support/pru-software-support.mk   | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
index 227057126a..9deb3e6661 100644
--- a/package/pru-software-support/pru-software-support.hash
+++ b/package/pru-software-support/pru-software-support.hash
@@ -1,3 +1,3 @@
 # Locally-calculated hash
-sha256  1e880d74f9a1d04324e6255cb7a0e3d40f92e08809dc81dc6c714447bac5c335  pru-software-support-v5.1.0.tar.gz
-sha256  77a974c14efc315a870a78d8a1021b96c83d316cf9e2ec6fe6a06db3b484e1ed  PRU-Package-v5.0-Manifest.html
+sha256  d6d1f76ab5a50dbdf1dff834b271f9d3ffa7424e4d9615e00713f3f81ed5787e  pru-software-support-package-v5.6.0.tar.gz
+sha256  a68530804624227e4f2e007eacb5c2d616695426082e895ee1e2d77d3833f5f7  PRU-Package-v6.0-Manifest.html
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
 
