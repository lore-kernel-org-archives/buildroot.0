From: Changming Huang <jerry.huang@nxp.com>
Date: Wed, 27 Nov 2019 15:17:14 +0800
Subject: [Buildroot] [PATCH v3 3/9] package/qoriq-rcw: bump to version
 LSDK-19.09
In-Reply-To: <20191127071720.15623-1-jerry.huang@nxp.com>
References: <20191127071720.15623-1-jerry.huang@nxp.com>
Message-ID: <20191127071720.15623-3-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jerry Huang <jerry.huang@nxp.com>

Change the RCW version to LSDK-19.09.

Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
---
changes since v2:
1. change the hash value.

changes since v1:
1. add-back license hash.
---
 package/nxp/qoriq-rcw/qoriq-rcw.hash | 2 +-
 package/nxp/qoriq-rcw/qoriq-rcw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nxp/qoriq-rcw/qoriq-rcw.hash b/package/nxp/qoriq-rcw/qoriq-rcw.hash
index e9708d960d..88460716f9 100644
--- a/package/nxp/qoriq-rcw/qoriq-rcw.hash
+++ b/package/nxp/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1421ada9fec10b12ff21cd9ad82f0a835b191cb2dde80f03547764574b1346c3 qoriq-rcw-LSDK-18.12.tar.gz
+sha256 4a9ce5bb1733239bf1b740b705df20f90802b16114e24f3fd56c08a7ba4b56c2 qoriq-rcw-LSDK-19.09.tar.gz
 sha256 a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd LICENSE
diff --git a/package/nxp/qoriq-rcw/qoriq-rcw.mk b/package/nxp/qoriq-rcw/qoriq-rcw.mk
index 3308f20192..7a0494adc6 100644
--- a/package/nxp/qoriq-rcw/qoriq-rcw.mk
+++ b/package/nxp/qoriq-rcw/qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RCW_VERSION = LSDK-18.12
+QORIQ_RCW_VERSION = LSDK-19.09
 QORIQ_RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
 QORIQ_RCW_SITE_METHOD = git
 QORIQ_RCW_LICENSE = BSD-3-Clause
-- 
2.17.1
