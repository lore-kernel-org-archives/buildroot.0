From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 21 Jun 2017 16:30:54 -0400
Subject: [Buildroot] [PATCH] mmc-utils: bump version to
	37c86e60c0442fef570b75cd81aeb1db4d0cbafd
In-Reply-To: <20170621203057.4346-1-aduskett@codeblue.com>
References: <20170621203057.4346-1-aduskett@codeblue.com>
Message-ID: <20170621203057.4346-5-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/mmc-utils/mmc-utils.hash | 2 +-
 package/mmc-utils/mmc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index a429079..35cd580 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4e5018e70f134b8c7ed05c84fca4b29fdce2ef2ca5abc0b9765939e6d8c3d912  mmc-utils-2cb6695e8dec00d887bdd5309d1b57d836fcd214.tar.gz
+sha256 92ba148648688fca6e0e0e30248ebc6b432bea55584760f20a013583f20a109d  mmc-utils-37c86e60c0442fef570b75cd81aeb1db4d0cbafd.tar.gz
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 5eb9a9a..0b9a6d1 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = 2cb6695e8dec00d887bdd5309d1b57d836fcd214
+MMC_UTILS_VERSION = 37c86e60c0442fef570b75cd81aeb1db4d0cbafd
 MMC_UTILS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
 MMC_UTILS_LICENSE = GPL-2.0
 
-- 
2.9.4
