From: Changming Huang <jerry.huang@nxp.com>
Date: Wed, 20 Nov 2019 12:07:17 +0800
Subject: [Buildroot] [PATCH 1/9] package/rcw: upgrade the rcw version to
 LSDK-19.09
In-Reply-To: <20191120040725.32207-1-jerry.huang@nxp.com>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
Message-ID: <20191120040725.32207-2-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change the RCW version to LSDK-19.09.

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
---
 package/rcw/rcw.hash | 3 +--
 package/rcw/rcw.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/rcw/rcw.hash b/package/rcw/rcw.hash
index 7de1ec659a..3fbb5d167f 100644
--- a/package/rcw/rcw.hash
+++ b/package/rcw/rcw.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256 1421ada9fec10b12ff21cd9ad82f0a835b191cb2dde80f03547764574b1346c3 rcw-LSDK-18.12.tar.gz
-sha256 a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd LICENSE
+sha256 b69a6a8b187ba794e0af716a509ced2bbac83da0f6e94b5c7331a34619db21b1  rcw-LSDK-19.09.tar.gz
diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
index 36d2da61b5..3a8cf5c444 100644
--- a/package/rcw/rcw.mk
+++ b/package/rcw/rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RCW_VERSION = LSDK-18.12
+RCW_VERSION = LSDK-19.09
 RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
 RCW_SITE_METHOD = git
 RCW_LICENSE = BSD-3-Clause
-- 
2.17.1
