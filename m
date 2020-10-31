From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 23:41:19 +0100
Subject: [Buildroot] [git commit] package/ima-evm-utils: bump to version
 1.3.2
Message-ID: <20201031222844.F3D6B82D9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5f977439a5051f8cb160d794c6491a26bf0df86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ima-evm-utils/ima-evm-utils.hash | 4 ++--
 package/ima-evm-utils/ima-evm-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ima-evm-utils/ima-evm-utils.hash b/package/ima-evm-utils/ima-evm-utils.hash
index 8d0eecfdb9..2cdba227ad 100644
--- a/package/ima-evm-utils/ima-evm-utils.hash
+++ b/package/ima-evm-utils/ima-evm-utils.hash
@@ -1,4 +1,4 @@
 # sha1 from sourceforge, sha256 locally computed
-sha1  bb0c1c2de5f6c179d9a84909e5e6698b86a4aac2  ima-evm-utils-1.3.1.tar.gz
-sha256 5304271f31a3601a2af5984942d9bd6c7532597c5a97250c9a4524074fc39925  ima-evm-utils-1.3.1.tar.gz
+sha1  034d163533ae5f9c06001b375ec7e5a1b09a3853  ima-evm-utils-1.3.2.tar.gz
+sha256 c2b206e7f9fbe62a938b7ae59e31906fefae4d5351fe01db739bd8346b75d4a7  ima-evm-utils-1.3.2.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
index 5c9aa2f7cd..cc53e02dd6 100644
--- a/package/ima-evm-utils/ima-evm-utils.mk
+++ b/package/ima-evm-utils/ima-evm-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMA_EVM_UTILS_VERSION = 1.3.1
+IMA_EVM_UTILS_VERSION = 1.3.2
 IMA_EVM_UTILS_SITE = http://downloads.sourceforge.net/project/linux-ima/ima-evm-utils
 IMA_EVM_UTILS_LICENSE = GPL-2.0
 IMA_EVM_UTILS_LICENSE_FILES = COPYING
