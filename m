From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 22:22:20 +0100
Subject: [Buildroot] [git commit] pru-software-support: fix legal info again
Message-ID: <20161207212310.514C6807F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8dbd27fe48fdcdfee4552c2fb58e422974152daa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 00810e0ea3976c5b26a7fd264870f15e17a2eaa2 still didn't fix the
license information properly, so this is a new commit (properly tested
this time) fixing the license information.

Fixes:

  http://autobuild.buildroot.net/results/ece1407b9f32472fb55823bb554dc026546cd26d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pru-software-support/pru-software-support.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index 16d0b97..06983c2 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -7,7 +7,7 @@
 PRU_SOFTWARE_SUPPORT_VERSION = 804b548e69ef9fdf44445f6d0968d81cb8a1e7b4
 PRU_SOFTWARE_SUPPORT_SITE = git://git.ti.com/pru-software-support-package/pru-software-support-package.git
 PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3c, GPLv2, Public Domain
-PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU_Package-v4.0-Manifest.html
+PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v4.0-Manifest.html
 PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
 HOST_PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru
 
