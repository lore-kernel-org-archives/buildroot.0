From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 22:40:01 +0100
Subject: [Buildroot] [git commit] pru-software-support: fix licensing
	information
Message-ID: <20161205214042.008B67FECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00810e0ea3976c5b26a7fd264870f15e17a2eaa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the path to the license file, and adjust the licensing information
according to the contents of this file.

Fixes:

  http://autobuild.buildroot.net/results/213cdda78b0a4762ee4fecc0f178df1225062c6f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pru-software-support/pru-software-support.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index 95d1e03..16d0b97 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -6,8 +6,8 @@
 
 PRU_SOFTWARE_SUPPORT_VERSION = 804b548e69ef9fdf44445f6d0968d81cb8a1e7b4
 PRU_SOFTWARE_SUPPORT_SITE = git://git.ti.com/pru-software-support-package/pru-software-support-package.git
-PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3c
-PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU_Package-v5.0-Manifest.html
+PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3c, GPLv2, Public Domain
+PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU_Package-v4.0-Manifest.html
 PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
 HOST_PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru
 
