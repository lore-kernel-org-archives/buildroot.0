From: Changming Huang <jerry.huang@nxp.com>
Date: Thu, 21 Nov 2019 18:23:17 +0800
Subject: [Buildroot] [PATCH v2 03/10] package/freescale-qoriq/fsl-qoriq-rcw:
 upgrade the rcw version to LSDK-19.09
In-Reply-To: <20191121102324.35225-1-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
Message-ID: <20191121102324.35225-4-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jerry Huang <jerry.huang@nxp.com>

Change the RCW version to LSDK-19.09.

Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
---
changes since v1:
1. add-back license hash
---
 package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.hash | 2 +-
 package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.hash b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.hash
index 7de1ec659a..413db80e6d 100644
--- a/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.hash
+++ b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1421ada9fec10b12ff21cd9ad82f0a835b191cb2dde80f03547764574b1346c3 rcw-LSDK-18.12.tar.gz
+sha256 4dca8adeda48836b86aa459cc526dfbb4e0873492682c3c3a828a28b82b7b100 fsl-qoriq-rcw-LSDK-19.09.tar.gz
 sha256 a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd LICENSE
diff --git a/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk
index a5f3854271..a2c3f4f8a6 100644
--- a/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk
+++ b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FSL_QORIQ_RCW_VERSION = LSDK-18.12
+FSL_QORIQ_RCW_VERSION = LSDK-19.09
 FSL_QORIQ_RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
 FSL_QORIQ_RCW_SITE_METHOD = git
 FSL_QORIQ_RCW_LICENSE = BSD-3-Clause
-- 
2.17.1
