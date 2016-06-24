From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 24 Jun 2016 12:38:47 -0400
Subject: [Buildroot] [PATCH 4/5] checkpolicy: bump to version 2.5
In-Reply-To: <1466786328-7860-1-git-send-email-Aduskett@gmail.com>
References: <1466786328-7860-1-git-send-email-Aduskett@gmail.com>
Message-ID: <1466786328-7860-3-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/checkpolicy/checkpolicy.hash | 2 +-
 package/checkpolicy/checkpolicy.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index 32b5ff6..bc5199c 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,2 +1,2 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 e6a0ac539b74859b4262b317eb90d9914deb15e7aa509659f47724d50fe2ecc6  checkpolicy-2.1.12.tar.gz
+sha256 33af9f3eb19135a7e6536ecd3fbb9686323000016cd51eb88346346ed7546001  checkpolicy-2.5.tar.gz
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index 4b7b2f3..f1b76d0 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 2.1.12
-CHECKPOLICY_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
+CHECKPOLICY_VERSION = 2.5
+CHECKPOLICY_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
 CHECKPOLICY_LICENSE = GPLv2
 CHECKPOLICY_LICENSE_FILES = COPYING
 
-- 
2.7.4
