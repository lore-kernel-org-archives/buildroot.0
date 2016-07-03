From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:40:55 +0200
Subject: [Buildroot] [git commit] dtc: add explicit dependencies for host
	variant
Message-ID: <20160703064348.C16037FABC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f56c62be67e99cd2675fea83e73d25d7f044ce97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dtc/dtc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index f3b6f3b..8fdcdbe 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -11,6 +11,7 @@ DTC_LICENSE = GPLv2+/BSD-2c
 DTC_LICENSE_FILES = README.license GPL
 DTC_INSTALL_STAGING = YES
 DTC_DEPENDENCIES = host-bison host-flex
+HOST_DTC_DEPENDENCIES = host-bison host-flex
 
 define DTC_POST_INSTALL_TARGET_RM_DTDIFF
 	rm -f $(TARGET_DIR)/usr/bin/dtdiff
