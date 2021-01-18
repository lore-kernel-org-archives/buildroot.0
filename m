From: Laurent Hartanerot <laurent.hartanerot@gmail.com>
Date: Mon, 18 Jan 2021 20:13:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/qoriq-rcw: bump to version
 LSDK-20.12
Message-ID: <20210118191334.13595-1-laurent.hartanerot@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Laurent Hartanerot <laurent.hartanerot@atos.net>

Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
---
 package/qoriq-rcw/qoriq-rcw.hash | 4 ++--
 package/qoriq-rcw/qoriq-rcw.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index 8c7c5d1fbf..5848799a0c 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  33fd492448a3ea3a29ee90d03544e437e32a0d1ea64a6c0a42b569e5864d4972  qoriq-rcw-LSDK-19.09-br1.tar.gz
-sha256  a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd  LICENSE
+sha256  bbb595f0b68beb114620f7aeaff073b90938329e10cd6b36daa9f2087f3119a0  qoriq-rcw-LSDK-20.12-br1.tar.gz
+sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index 2e06b6d53e..ecc5ce5eb4 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RCW_VERSION = LSDK-19.09
+QORIQ_RCW_VERSION = LSDK-20.12
 QORIQ_RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
 QORIQ_RCW_SITE_METHOD = git
 QORIQ_RCW_LICENSE = BSD-3-Clause
-- 
2.20.1
