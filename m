From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 11 Mar 2021 08:29:26 -0600
Subject: [Buildroot] [PATCH v11 3/9] package/lld: bump to version 11.1.0
In-Reply-To: <20210311142932.44985-1-matthew.weber@rockwellcollins.com>
References: <20210311142932.44985-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210311142932.44985-3-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/lld/lld.hash | 2 +-
 package/lld/lld.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lld/lld.hash b/package/lld/lld.hash
index 2144cc5666..17b8d18997 100644
--- a/package/lld/lld.hash
+++ b/package/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 86262bad3e2fd784ba8c5e2158d7aa36f12b85f2515e95bc81d65d75bb9b0c82  lld-9.0.1.src.tar.xz
+sha256 017a788cbe1ecc4a949abf10755870519086d058a2e99f438829aef24f0c66ce  lld-11.1.0.src.tar.xz
 sha256 f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/lld/lld.mk b/package/lld/lld.mk
index cd1a03c1d3..4bf903cda0 100644
--- a/package/lld/lld.mk
+++ b/package/lld/lld.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # LLVM, Clang and lld should be version bumped together
-LLD_VERSION = 9.0.1
+LLD_VERSION = 11.1.0
 LLD_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLD_VERSION)
 LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
 LLD_LICENSE = Apache-2.0 with exceptions
-- 
2.17.1
