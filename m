From: Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Tue,  9 Apr 2019 08:07:22 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/llvm: bump to 8.0.0
Message-ID: <20190409060723.1654-1-valentinkorenblit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The license file hash changed due to a copyright year update:

-Copyright (c) 2003-2018 University of Illinois at Urbana-Champaign.
+Copyright (c) 2003-2019 University of Illinois at Urbana-Champaign.

Changes v1 -> v2:
	- Add comment about changes in license file

Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 package/llvm/llvm.hash | 4 ++--
 package/llvm/llvm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
index 531361ae10..4c5cea17ff 100644
--- a/package/llvm/llvm.hash
+++ b/package/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 a38dfc4db47102ec79dcc2aa61e93722c5f6f06f0a961073bd84b78fb949419b llvm-7.0.1.src.tar.xz
-sha256 0303dfeaac87b80d2d1e543aa38d5be77b0eac93c3d04fe7e3c8eaa71a778667 LICENSE.TXT
+sha256 8872be1b12c61450cacc82b3d153eab02be2546ef34fa3580ed14137bb26224c llvm-8.0.0.src.tar.xz
+sha256 24b67da19b1422a819395738cb83ea34eee3fdce52870b0d1758524ba1615069 LICENSE.TXT
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 952f678eee..cd374d74b4 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLVM_VERSION = 7.0.1
+LLVM_VERSION = 8.0.0
 LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = NCSA
-- 
2.11.0
